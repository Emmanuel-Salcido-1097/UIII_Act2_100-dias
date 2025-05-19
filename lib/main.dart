import 'package:flutter/material.dart';
import 'package:myapp/animatedlist_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAnimatedList(),
    );
  }
}

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({super.key});

  @override
  _MyAnimatedListState createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList>
    with TickerProviderStateMixin {
  final List<User> selectedUser = [];

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> selectedListKey =
      GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 35),
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const Text("Seleccione el Banco"),
                    const SizedBox(height: 20),
                    Expanded(
                      child: AnimatedList(
                        scrollDirection: Axis.horizontal,
                        key: selectedListKey,
                        initialItemCount: selectedUser.length,
                        itemBuilder: (context, index, animation) {
                          return displaySelectedUser(
                            user: selectedUser[index],
                            index: index,
                            animation: animation,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  initialItemCount: users.length,
                  itemBuilder: (context, index, animation) {
                    return displayUser(
                      user: users[index],
                      index: index,
                      animation: animation,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget displaySelectedUser({
    required User user,
    required int index,
    required Animation<double> animation,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: FadeTransition(
        opacity: animation,
        child: Column(
          children: [
            SizedBox(
              width: 50,
              child: Text(
                user.name,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Stack(
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent,
                    backgroundImage: NetworkImage(user.image),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        listKey.currentState?.insertItem(
                          users.length,
                          duration: const Duration(milliseconds: 500),
                        );
                        selectedListKey.currentState?.removeItem(
                          index,
                          (context, animation) => displaySelectedUser(
                              user: user, index: index, animation: animation),
                          duration: const Duration(milliseconds: 300),
                        );
                        selectedUser.removeAt(index);
                        users.add(user);
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget displayUser({
    required User user,
    required int index,
    required Animation<double> animation,
  }) {
    return GestureDetector(
      onTap: () {
        if (selectedUser.length >= 5) return;
        setState(() {
          listKey.currentState?.removeItem(
            index,
            (context, animation) =>
                displayUser(user: user, index: index, animation: animation),
            duration: const Duration(milliseconds: 300),
          );
          selectedListKey.currentState?.insertItem(
            selectedUser.length,
            duration: const Duration(milliseconds: 500),
          );
          selectedUser.add(user);
          users.removeAt(index);
        });
      },
      child: FadeTransition(
        opacity: animation,
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Row(children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                user.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                user.username,
                style: const TextStyle(color: Colors.black45),
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
