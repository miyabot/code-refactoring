import 'package:flutter/material.dart';

// ========================================
// ログイン画面（Before：汚いコード）
// ========================================
// home: の中にこのウィジェットを指定するだけで呼び出せます。
// 例： home: const MessyLoginScreen(),

class MessyLoginScreen extends StatefulWidget {
  const MessyLoginScreen({super.key});

  @override
  State<MessyLoginScreen> createState() => _MessyLoginScreenState();
}

class _MessyLoginScreenState extends State<MessyLoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = "";

  void checkLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username != "") {
      if (username.length >= 4) {
        if (username.length <= 20) {
          if (password != "") {
            if (password.length >= 8) {
              if (password.length <= 20) {
                bool hasNumber = false;
                bool hasLetter = false;
                for (int i = 0; i < password.length; i++) {
                  if (password[i].contains(RegExp(r'[0-9]'))) {
                    hasNumber = true;
                  }
                  if (password[i].contains(RegExp(r'[a-zA-Z]'))) {
                    hasLetter = true;
                  }
                }
                if (hasNumber == true) {
                  if (hasLetter == true) {
                    if (username == "admin") {
                      if (password == "password123") {
                        setState(() {
                          message = "ログイン成功！ようこそ、" + username + "さん";
                        });
                      } else {
                        setState(() {
                          message = "エラー：パスワードが間違っています";
                        });
                      }
                    } else {
                      setState(() {
                        message = "エラー：ユーザー名が間違っています";
                      });
                    }
                  } else {
                    setState(() {
                      message = "エラー：パスワードには英字を含めてください";
                    });
                  }
                } else {
                  setState(() {
                    message = "エラー：パスワードには数字を含めてください";
                  });
                }
              } else {
                setState(() {
                  message = "エラー：パスワードは20文字以下にしてください";
                });
              }
            } else {
              setState(() {
                message = "エラー：パスワードは8文字以上にしてください";
              });
            }
          } else {
            setState(() {
              message = "エラー：パスワードを入力してください";
            });
          }
        } else {
          setState(() {
            message = "エラー：ユーザー名は20文字以下にしてください";
          });
        }
      } else {
        setState(() {
          message = "エラー：ユーザー名は4文字以上にしてください";
        });
      }
    } else {
      setState(() {
        message = "エラー：ユーザー名を入力してください";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン（汚いコード版）"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "ユーザー名",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "パスワード",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: checkLogin,
              child: const Text("ログイン"),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                color: message.contains("成功") ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// テスト用ログイン情報
// ユーザー名: admin
// パスワード: password123
