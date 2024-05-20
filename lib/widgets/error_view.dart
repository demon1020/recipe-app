import 'package:receipe/core.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onTap;

  const ErrorView({super.key, required this.errorMessage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 150,
              child: AppButton(
                onTap: onTap,
                text: "Retry",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
