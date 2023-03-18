import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:project_test/tab_home.dart';
import 'package:project_test/kakao_login.dart';
import 'package:project_test/main_view_model.dart';
import 'package:project_test/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with WidgetsBindingObserver {
  // LifeCycle을 관리
  late AppLifecycleState _lastLifecycleState;
  // 로그인 컨트롤러
  late TextEditingController userIdController;
  late TextEditingController passwordController;
  late String uId;
  late String uPassword;
  // 카카오 로그인, 로그아웃 관리

  final viewModel = MainViewModel(KakaoLogin());

  // 텍스트필드 외의 화면을 눌렀을 때 텍스트필드의 Focus를 해제하기 위해 FocusNode 선언
  FocusNode idFocus = FocusNode();
  FocusNode pwFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // ***** SharedPreferences 초기화 *****
    _initSharedPreferences();

    userIdController = TextEditingController();
    passwordController = TextEditingController();
    uId = '';
    uPassword = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      //** detached */
      case AppLifecycleState.detached:
        // 응용 프로그램은 여전히 flutter 엔진에서 호스팅되지만 "호스트 View"에서 분리됩니다.
        // 앱이 이 상태에 있으면 엔진이 "View" 없이 실행됩니다.
        // 엔진이 처음 초기화 될 때 "View" 연결 진행 중이거나 네비게이터 팝으로 인해 "View"가 파괴된 후일 수 있습니다.
        print('detached');
        break;

      //** resumed */
      case AppLifecycleState.resumed:
        // 앱이 표시되고 사용자 입력에 응답합니다.
        // 주의! 최초 앱 실행때는 해당 이벤트가 발생하지 않습니다.
        print('resume');
        break;

      //** inactive */
      case AppLifecycleState.inactive:
        // 앱이 비활성화 상태이고 사용자의 입력을 받지 않습니다.
        // ios에서는 포그라운드 비활성 상태에서 실행되는 앱 또는 Flutter 호스트 뷰에 해당합니다.
        // 안드로이드에서는 화면 분할 앱, 전화 통화, PIP 앱, 시스템 대화 상자 또는 다른 창과 같은 다른 활동이 집중되면 앱이 이 상태로 전환됩니다.
        // inactive가 발생되고 얼마 후 paused가 발생합니다.
        print('inactive');
        break;

      //** paused */
      case AppLifecycleState.paused:
        // 앱이 현재 사용자에게 보이지 않고, 사용자의 입력을 받지 않으며, 백그라운드에서 동작 중입니다.
        // 안드로이드의 onPause()와 동일합니다.
        // 응용 프로그램이 이 상태에 있으면 엔진은 Window.onBeginFrame 및 Window.onDrawFrame 콜백을 호출하지 않습니다.
        print('paused');
        break;
    }
    _lastLifecycleState = state;

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: GestureDetector(
        onTap: (() {
          idFocus.unfocus();
          pwFocus.unfocus();
        }),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Log In'),
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Jeju',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              TabHome(userId: "id", password: "pw")),
                        ),
                      );
                    },
                    child: Text('home')),

                // ID 입력
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                      child: TextField(
                        controller: userIdController,
                        focusNode: idFocus,
                        decoration: const InputDecoration(
                          labelText: 'ID를 입력하세요',
                        ),
                      ),
                    ),
                    // Password 입력
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                      child: TextField(
                        controller: passwordController,
                        focusNode: pwFocus,
                        decoration: const InputDecoration(
                          labelText: '비밀번호를 입력하세요',
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: ((context) => Home()),
                            //   ),
                            // );

                            // 아이디 입력창 or 비밀번호 입력창 Empty 여부 체크
                            if (userIdController.text.trim().isEmpty ||
                                passwordController.text.trim().isEmpty) {
                              errorSnackBar(context);
                            } else {
                              // 아이디, 비번 모두 입력했다면 DB에 저장된 회원정보 체크
                              //**********************************************
                              // 이 단계에서 DB 등록된 회원정보 비교해줘야함 (수정할것!!!!!!!)
                              //**********************************************/
                              // Select 쿼리
                              uId = userIdController.text;
                              uPassword = passwordController.text;
                              loginChk();
                            }
                          },
                          child: const Text(
                            '로그인',
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const SignUp()),
                              ),
                            );
                          },
                          child: const Text(
                            '회원가입',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (() async {
                        _kakaoShowDialog(context);
                      }),
                      child: Image.asset(
                        'images/kakao_login_medium_wide.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----- Functions -----

  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userIdController.text = (prefs.getString('p_userId') ?? "");
      passwordController.text = (prefs.getString('p_password') ?? "");
    });
  }

  // Desc: ID/PW 미입력시 스낵바 띄워주기
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '사용자 ID와 PW를 입력하세요.',
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Desc: ID or PW 불일치
  // 2022.12.25
  checkSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        '사용자 ID나 PW가 일치하지 않습니다.',
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Color.fromARGB(255, 138, 143, 239),
    ));
  }

  // Desc: 카카오 로그인 시도시 성공/실패에 따라 Dialog 출력
  // 2022.12.26
  _kakaoShowDialog(BuildContext context) async {
    await viewModel.login();
    setState(() {
      showDialog(
        context: context,
        builder: ((context) {
          // Desc: 카카오 로그인 정보 불러오기에 성공하면 Dialog 띄우고,
          // 실패하면 Error Dialog 띄운 후 pop
          // 2022.12.26
          if (viewModel.user?.kakaoAccount?.profile?.nickname == null) {
            return AlertDialog(
              title: const Text('카카오 로그인 실패'),
              content: const Text('로그인 정보 불러오기에 실패했습니다'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                  ),
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: const Text('뒤로가기'),
                )
              ],
            );
          } else {
            return AlertDialog(
              title: const Text('카카오 로그인 성공'),
              content: SizedBox(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      viewModel.user?.kakaoAccount?.profile?.profileImageUrl ??
                          '',
                      height: 100,
                      errorBuilder:
                          (BuildContext context, Object error, stackTrace) {
                        return const Text(
                          'Error: 프로필 불러오기 실패',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      '${viewModel.user?.kakaoAccount?.profile?.nickname}님 환영합니다',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: (() {
                    // Desc: 여기서 pop을 시켜야 로그아웃시 일반회원, 카카오회원 동일하게
                    // pop 두 번으로 로그인 화면으로 돌아오게 됨
                    // 2022.12.25
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => TabHome(
                                  userId:
                                      "${viewModel.user?.kakaoAccount?.profile?.nickname}",
                                  password: "kakao",
                                ))));
                  }),
                  child: const Text(
                    '확인',
                  ),
                ),
                // ***** 카카오 로그인 성공 시 취소버튼 추가할지 정할것
                // ***** 취소버튼 추가하면 버튼 클릭시 로그아웃 되도록 설정해야 함
                // ElevatedButton(
                //   onPressed: (() {
                //     Navigator.pop(context);
                //   }),
                //   child: const Text(
                //     '취소',
                //   ),
                // ),
              ],
            );
          }
        }),
      );
    });
  }
  // ********************* DB 생성 후 수정할 것 *********************
  //** userIdController.text.trim().isNotEmpty &&
  //passwordController.text.trim().isNotEmpty일 경우 실행
  // *//

  // _showDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('로그인 성공'),
  //           content: Text('${userIdController.text}님 환영합니다'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 // 로그인 성공시 SharedPreferences에 저장된다.
  //                 _saveSharedPreferences();
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: ((context) {
  //                       return Home(
  //                           userId: userIdController.text,
  //                           password: passwordController.text);
  //                     }),
  //                   ),
  //                 );
  //               },
  //               child: const Text(
  //                 '확인',
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }

  // Desc: 일반 회원 로그인 시도 시 입력한 ID와 PW가 DB에 있는지 SELECT
  // 2022.12.26
  Future<int> loginChk() async {
    int result = 0;
    var url = Uri.parse(
        'http://localhost:8080/Flutter_Test/user_login_check_flutter.jsp?uId=$uId&uPassword=$uPassword');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List data = dataConvertedJSON['results'];
    for (int i = 0; i < data.length; i++) {
      if (uId == data[i]['uId'] && uPassword == data[i]['uPassword']) {
        result = 1;
        String uNickname = data[i]['uNickname'];
        _loginSuccess(uNickname);
      }
    }
    if (result == 0) {
      _loginFail();
    }
    return result;
  }

  // Desc: 로그인 성공 시 dialog 출력
  // 2022.12.27
  _loginSuccess(String uNickname) async {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('로그인 성공'),
            content: Text('$uNickname님 환영합니다'),
            actions: [
              ElevatedButton(
                onPressed: (() {
                  Navigator.pop(context);
                  _saveSharedPreferences();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          TabHome(userId: uId, password: uPassword)),
                    ),
                  );
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                ),
                child: const Text(
                  '확인',
                ),
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                ),
                child: const Text(
                  '취소',
                ),
              ),
            ],
          );
        }));
  }

  // Desc: 로그인 실패 시 dialog 출력
  // 2022.12.27
  _loginFail() async {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('로그인 실패'),
            content: const Text('ID와 비밀번호를 확인해주세요'),
            actions: [
              ElevatedButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 138, 143, 239),
                ),
                child: const Text(
                  '확인',
                ),
              )
            ],
          );
        }));
  }

  // Desc: 로그인 성공시 SharedPreferences에 저장
  // 2022.12.25
  _saveSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userId', userIdController.text);
    pref.setString('p_password', passwordController.text);
  }

  // Desc: Lifecycle 정해주고 해당 State가 되면 저장된 로그인 정보 만료시켜줌
  // 2022.12.25
  _disposeSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  // Desc: Inactivate Back Button after Logged Out
  Future<bool> _willPopScope() async {
    return false;
  }

  // Desc: MySQL DB에서 로그인 정보 (ID, Password, 닉네임) 가져오기
  // 2022.12.26
}
