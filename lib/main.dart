import 'package:flutter/material.dart';
import 'package:flutter_animation_practice/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        // これを試してみてください： flutter run "でアプリケーションを実行してみてください。すると
        // 紫色のツールバーが表示されます。次に、アプリを終了せずに
        // 以下のcolorSchemeのseedColorをColors.greenに変更してみてください。
        // アプリを終了せずに、コマンドラインを使った場合は"r"を押してください。
        //
        // カウンタがゼロにリセットされなかったことに注目してください。
        // アプリケーションの状態はリロード中に失われません。状態をリセットするには、代わりにホット
        // 再起動を使用してください。
        //
        // これは値だけでなく、コードにも有効です： ほとんどのコード変更は
        // ほとんどのコード変更はホットリロードだけでテストできる。
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.seedColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: AppConstants.appName),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // このsetStateの呼び出しは、Flutterフレームワークに、このStateで何かが変更されたことを伝える。
  // これにより、以下のビルドメソッドが再実行され、更新された値がディスプレイに反映されます。
  // もしsetState()を呼び出さずに__counterを変更した場合、ビルドメソッドは再度呼び出されない。
  // そのため、何も起こらないように見える。
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isMovingRight = true; // 右に動いているかどうかを示すフラグ
  bool _isAnimating = true; // アニメーションの状態を管理するフラグ

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isMovingRight = !_isMovingRight; // 方向を反転
        });
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isMovingRight = !_isMovingRight; // 方向を反転
        });
        _controller.forward();
      }
    });

    // 中央からスタートするために、アニメーションの開始位置を設定
    _controller.value = 0.5;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは、setStateが呼ばれるたびに再実行される。
    // 上記の_incrementCounterメソッドによって実行される。
    //
    // Flutterフレームワークはビルドメソッドの再実行を高速化するように最適化されている。
    // 更新が必要なものは、個別にインスタンスを変更するのではなく再構築すればよい。
    // ウィジェットのインスタンスを個別に変更するのではなく、更新が必要なものを再構築するだけでよい。

    // buildメソッド内でMediaQueryを使用して画面サイズを取得し、_animationを初期化します。
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.25;

    _animation = Tween<double>(
      begin: screenWidth / 2 - imageWidth / 2, // 中央からスタート
      end: -screenWidth / 2 + imageWidth / 2, // 左に画面幅分移動
    ).animate(_controller);

    return Scaffold(
      appBar: AppBar(
        // ここでは、App.buildメソッドで作成されたMyHomePageオブジェクトから値を取り出し、それを使ってappbarのタイトルを設定する。
        // App.buildメソッドによって作成されたMyHomePageオブジェクトから値を取得し、それを使用してappbarのタイトルを設定します。
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_isAnimating) {
                _controller.stop(); // アニメーションを停止
              } else {
                _isMovingRight = false; // 再開時に必ず左に移動するように設定
                _controller.forward(); // アニメーションを再開
              }
              _isAnimating = !_isAnimating; // 状態を反転
            });
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..translate(_animation.value, 0)
                      ..scale(_isMovingRight ? 1.0 : -1.0, 1.0), // 進行方向に応じて反転
                child: SizedBox(
                  width: imageWidth,
                  child: Image.asset('images/walk.png'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
