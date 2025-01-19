import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        // これはアプリケーションのテーマです。
        //
        // これを試してみてください： flutter run "でアプリケーションを実行してみてください。すると
        // 紫色のツールバーが表示されます。次に、アプリを終了せずに
        // 以下のcolorSchemeのseedColorをColors.greenに変更してみてください。
        // アプリを終了せずに、コマンドラインを使った場合は 「r 」を押してください。
        //
        // カウンタがゼロにリセットされなかったことに注目してください。
        // アプリケーションの状態はリロード中に失われません。状態をリセットするには、代わりにホット
        // 再起動を使用してください。
        //
        // これは値だけでなく、コードにも有効です： ほとんどのコード変更は
        // ほとんどのコード変更はホットリロードだけでテストできる。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // このウィジェットはアプリケーションのホームページです。
  // つまり、ステートフルです。
  // どのように見えるかに影響するフィールドを含みます。

  // このクラスは、ステートの設定です。このクラスは状態の設定です。
  // 親ウィジェット（この場合は App ウィジェット）から提供された値（この場合はタイトル）を保持し、
  // App ウィジェットのビルドメソッドで使用されます。
  // ステートのビルドメソッドで使用されます。Widget サブクラスのフィールドは
  // 常に 「final」 とマークされます。
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      // このsetStateの呼び出しは、Flutterフレームワークに、このStateで何かが変更されたことを // 伝える。
      // これにより、以下のビルドメソッドを再実行する。
      // これにより、以下のビルドメソッドが再実行され、更新された値がディスプレイに反映されます。
      // もしsetState()を呼び出さずに__counterを変更した場合、ビルドメソッドは再度呼び出されない。
      // そのため、何も起こらないように見える。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // このメソッドは、setStateが呼ばれるたびに再実行される。
    // 上記の_incrementCounterメソッドによって実行される。
    //
    // Flutterフレームワークはビルドメソッドの再実行を高速化するように最適化されている。
    // 更新が必要なものは、個別にインスタンスを変更するのではなく再構築すればよい。
    // ウィジェットのインスタンスを個別に変更するのではなく、更新が必要なものを再構築するだけでよい。
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.

        // ここの色を特定の色に変更してみてください。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        // ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから値を取り出し、それを使ってappbarのタイトルを設定する。
        // App.buildメソッドによって作成されたMyHomePageオブジェクトから値を取得し、それを使用してappbarのタイトルを設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        // センターはレイアウトウィジェットです。子ウィジェットを1つ取り配置します。
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.

          // カラムもレイアウト・ウィジェットです。子ウィジェットのリストを受け取り縦に並べます。デフォルトでは親と同じ高さになるようにします。
          // カラムは、それ自身のサイズと // 子の位置を制御するためのさまざまなプロパティを持っています。
          // どのように子プロパティを配置するかを制御します。ここでは、mainAxisAlignment を使用して、
          // 子を垂直に中央に配置します。主軸は垂直軸です。
          //
          // これを試してください： デバッグペイント」を起動します（IDEで 「Toggle Debug Paint 」アクションを選択するか「p 」キーを押します）。
          // IDE で 「Toggle Debug Paint」 アクションを選択するか、コンソールで 「p」 を押します）。
          // 各ウィジェットのワイヤーフレームを見ることができます。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      // この末尾のカンマは、ビルド・メソッドの自動書式設定に便利である。
    );
  }
}
