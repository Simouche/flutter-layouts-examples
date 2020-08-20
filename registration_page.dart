class SignUpPage extends StatelessWidget {
  static const String routeName = 'register/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.all(0.0),
          children: [
            Stack(
              children: <Widget>[
                Image(
                  image: const AssetImage("assets/back_ground.png"),
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.only(top: 130.0, left: 30.0),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: WHITE,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(height: 50),
            _UsernameTextField(),
            _EmailTextField(),
            _PasswordTextField(),
            _ConfirmPasswordTextField(),
            SizedBox(height: 50),
            _CheckBox(),
            _RegisterAndLoginButtons(),
            _AlreadyUser(),
          ],
        ),
      ),
    );
  }
}

class _CheckBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxState();
  }
}

class _CheckBoxState extends State<_CheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 15, right: 15),
      child: CheckboxListTile(
        title: Text('I agree to '),
        value: _isChecked,
        onChanged: (val) {
          setState(
                () {
              _isChecked = val;
              if (val == true) {
                // _currText = t;
              }
            },
          );
        },
      ),
    );
  }
}

class _AlreadyUser extends StatelessWidget {
  const _AlreadyUser();

  @override
  Widget build(BuildContext context) {
    return //Align(

      Container(
        //Padding(
        //  padding: EdgeInsets.only(top: , left: 50, right: 50),
        //  alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 70.0),
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Text(
                'Already a User ?',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 2,
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In ->',
                    style: TextStyle(color: Color(0xff42b1de)),
                  ))
            ],
          ));
  }
}

class _UsernameTextField extends StatelessWidget {
  const _UsernameTextField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final _usernameController = TextEditingController();

    return Container(
      child: Padding(
        child: TextFormField(
          cursorColor: colorScheme.onSurface,
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Username",
            labelStyle: TextStyle(letterSpacing: mediumLetterSpacing),
          ),
          style: TextStyle(),
          /* onChanged: (value) {
                    nom = value;
                  },*/
        ),
        padding: EdgeInsets.only(top: 10, right: 30, left: 30),
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final _passwordController = TextEditingController();

    return Container(
      child: Padding(
        child: TextFormField(
          cursorColor: colorScheme.onSurface,
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            labelStyle: TextStyle(letterSpacing: mediumLetterSpacing),
          ),
          style: TextStyle(),
          /* onChanged: (value) {
                    nom = value;
                  },*/
        ),
        padding: EdgeInsets.only(top: 10, right: 30, left: 30),
      ),
    );
  }
}

class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final _confirmPasswordController = TextEditingController();

    return Container(
      child: Padding(
        child: TextFormField(
          cursorColor: colorScheme.onSurface,
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Confirm password",
            labelStyle: TextStyle(letterSpacing: mediumLetterSpacing),
          ),
          style: TextStyle(),
          /* onChanged: (value) {
                    nom = value;
                  },*/
        ),
        padding: EdgeInsets.only(top: 10, right: 30, left: 30),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final _emailController = TextEditingController();

    return Container(
      child: Padding(
        child: TextFormField(
          cursorColor: colorScheme.onSurface,
          controller: _emailController,
          decoration: InputDecoration(
            hintText: "E-mail",
            labelStyle: TextStyle(letterSpacing: mediumLetterSpacing),
          ),
          keyboardType: TextInputType.emailAddress,
          autovalidate: true,
          autocorrect: false,
          validator: (_) {
            //return !state.isEmailValid ? 'Email invalide' : null;
          },
          style: TextStyle(),
          /*onChanged: (value) {
                    email = value;
                  },*/
        ),
        padding: EdgeInsets.only(top: 10, right: 30, left: 30),
      ),
    );
  }
}

class _RegisterAndLoginButtons extends StatelessWidget {
  const _RegisterAndLoginButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10, right: 30, left: 30),
        child: FlatButton(
            color: Color(0xff42b1de),
            child: Text(
              'CREATE ACCOUNT',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => null))));
  }
}

class AuthButtons extends StatelessWidget {
  const AuthButtons(
      {Key key,
        this.buttonColor,
        this.text,
        this.height,
        this.width = 250,
        this.onPressed,
        this.textColor = Colors.white})
      : super(key: key);

  final Color buttonColor, textColor;
  final String text;
  final double height, width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => onPressed(),
      child: Container(
        width: this.width,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: this.buttonColor != null ? this.buttonColor : null,
    );
  }
}
