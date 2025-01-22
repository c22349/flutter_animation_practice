import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animate Demo',
      theme: ThemeData(
        // これを試してみてください： flutter run "でアプリケーションを実行してみてください。すると
        // 紫色のツールバーが表示されます。次に、アプリを終了せずに
        // 以下のcolorSchemeのseedColorをColors.greenに変更してみてください。
        // アプリを終了せずに、コマンドラインを使った場合は 「r」を押してください。
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
      home: const MyHomePage(title: 'Animate Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // このウィジェットはアプリケーションのホームページです。
  // つまり、ステートフルです。
  // どのように見えるかに影響するフィールドを含みます。

  // このクラスは、ステートの設定です。このクラスは状態の設定です。
  // 親ウィジェット（この場合はAppウィジェット）から提供された値（この場合はタイトル）を保持し、
  // App ウィジェットのビルドメソッドで使用されます。
  // ステートのビルドメソッドで使用されます。Widgetサブクラスのフィールドは常に「final」とマークされます。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // このsetStateの呼び出しは、Flutterフレームワークに、このStateで何かが変更されたことを伝える。
  // これにより、以下のビルドメソッドが再実行され、更新された値がディスプレイに反映されます。
  // もしsetState()を呼び出さずに__counterを変更した場合、ビルドメソッドは再度呼び出されない。
  // そのため、何も起こらないように見える。
  @override
  Widget build(BuildContext context) {
    // このメソッドは、setStateが呼ばれるたびに再実行される。
    // 上記の_incrementCounterメソッドによって実行される。
    //
    // Flutterフレームワークはビルドメソッドの再実行を高速化するように最適化されている。
    // 更新が必要なものは、個別にインスタンスを変更するのではなく再構築すればよい。
    // ウィジェットのインスタンスを個別に変更するのではなく、更新が必要なものを再構築するだけでよい。
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから値を取り出し、それを使ってappbarのタイトルを設定する。
        // App.buildメソッドによって作成されたMyHomePageオブジェクトから値を取得し、それを使用してappbarのタイトルを設定します。
        title: Text(widget.title),
      ),
      body: Center(
        // カラムもレイアウト・ウィジェットです。子ウィジェットのリストを受け取り縦に並べます。デフォルトでは親と同じ高さになるようにします。
        // カラムは、それ自身のサイズと // 子の位置を制御するためのさまざまなプロパティを持っています。
        // どのように子プロパティを配置するかを制御します。ここでは、mainAxisAlignment を使用して、
        // 子を垂直に中央に配置します。主軸は垂直軸です。
        //
        // これを試してください： デバッグペイント」を起動します（IDEで 「Toggle Debug Paint 」アクションを選択するか「p 」キーを押します）。
        // IDE で 「Toggle Debug Paint」 アクションを選択するか、コンソールで 「p」 を押します）。
        // 各ウィジェットのワイヤーフレームを見ることができます。
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('images/walk.png')],
        ),
      ),
    );
  }
}
