import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Login';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  bool changebtn = false;
  int _counter = 0;

  final _formKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Images
            Image.asset(
              "assets/image1.png",
              width: 300,
              height: 300,
            ),
            //Button
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            //Form
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 42.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Please enter your username",
                            labelText: "Username"),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This feild is required';
                          }
                          return null;
                        },
                      ),
                      //Password
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Please enter your password",
                            labelText: "Password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This feild is required';
                          }
                          return null;
                        },
                      ),
                      //Login Button
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28.0),
                          child: InkWell(
                              child: FilledButton(
                            onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {
                                  _navigateToNextScreen(context),
                                }
                            },
                            child: Text("Login"),
                            style: TextButton.styleFrom(
                                minimumSize: Size(350, 56),
                                backgroundColor: Colors.black,
                                textStyle: TextStyle(fontSize: 20)),
                          ))),

                      InkWell(
                        onTap: () => {_navigateToNextScreen(context)},
                        child: Text("Skip"),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
  }

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 26),
            ),
          ],
        ))),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Divyansh Maurya"),
                  accountEmail: Text("divyanshm510@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/avatar.png"),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    _navigateToNextScreen(context);
                  },
                  child: ListTile(
                    title: Text("Home"),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Account()));
                  },
                  child: ListTile(
                    title: Text("Account"),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: ListTile(
                    title: Text("Sign out"),
                  )),
            ],
          ),
        ));
  }
}

class Account extends StatelessWidget {
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Account')),
        body: const Text("Hello World"),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Divyansh Maurya"),
                  accountEmail: Text("divyanshm510@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/avatar.png"),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    _navigateToNextScreen(context);
                  },
                  child: ListTile(
                    title: Text("Home"),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Account()));
                  },
                  child: ListTile(
                    title: Text("Account"),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: ListTile(
                    title: Text("Sign out"),
                  )),
            ],
          ),
        ));
  }
}
