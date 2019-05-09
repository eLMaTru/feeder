import 'package:feeder/src/com/hht/models/auth_type.dart';
import 'package:feeder/src/com/hht/scope_models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthView();
  }
}

class _AuthView extends State<AuthView> {



  String confirmEmail;
  String _confirmPassword;

  Map<String, dynamic> _formData = {
    'email': '',
    'password': '',
    'terms': false
  };
  final GlobalKey<FormState> _formkKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  AuthType _authType = AuthType.Login;

  Widget _buildEmailTextField() {
    return TextFormField(style: TextStyle(color: Colors.white) ,obscureText: false,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        
        labelText: 'E-Mail',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        _formData['email'] = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'invalid E-Mail';
        }
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(style: TextStyle(color: Colors.white),
      controller: _passwordTextEditingController,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
         
          labelText: 'Password'),
      obscureText: true,
      onSaved: (String value) {
        _formData['password'] = value;
       
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'invalid Password';
        }
      },
    );
  }

  Widget _buildPasswordConfirmTextField() {
    return TextFormField(style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Confirm Password'),
      obscureText: true,
      onSaved: (String value) {
        
        _confirmPassword = value;
      },
      validator: (String value) {
        if (_passwordTextEditingController.text != value) {
          return 'Password not match';
        }
      },
      
    );
  }

  Widget _buildSwitch() {
    return SwitchListTile(
      title: Text(
        'Accept Terms',
        style: TextStyle(color: Colors.white),
      ),
      value: _formData['terms'],
      onChanged: (bool value) {
        setState(() {
          _formData['terms'] = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/food_1280.jpg'),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkKey,
              child: Container(
                width: targetWidth,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _authType == AuthType.Login
                        ? Container()
                        : _buildPasswordConfirmTextField(),
                    _authType == AuthType.Login ? Container() : _buildSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton(
                      child: Text(
                          'Switch to ${_authType == AuthType.Login ? 'Sign Up' : 'Login'}'),
                      onPressed: () {
                        setState(() {
                          _authType = _authType == AuthType.Login
                              ? AuthType.Signup
                              : AuthType.Login;
                        });
                      },
                     textColor: Colors.white,),
                    SizedBox(
                      height: 10.0,
                    ),
                    ScopedModelDescendant<MainModel>(builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return RaisedButton(
                        textColor: Colors.white,
                        color: Theme.of(context).accentColor,
                        child: Text(
                            '${_authType == AuthType.Login ? 'Login' : 'Sign Up'}'),
                        onPressed: () {
                          model.signup('andymota@gmail.com', 'matru', '1234');
                          //_submitForm(model.login, model.signup);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(Function login, Function signup) async {
    if (_authType == AuthType.Login) {
      _formData['terms'] = true;
    }

    if (!_formkKey.currentState.validate() || !_formData['terms']) {
      return;
    }

    _formkKey.currentState.save();

    print(_formData);
    if (_authType == AuthType.Signup) {
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('An Error  Ocurred'),
              content: Text('message'),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
    if (_authType == AuthType.Login) {
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('An Error  Ocurred'),
              content: Text('message'),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    //  Navigator.pushReplacementNamed(context, '/products');
  }
}
