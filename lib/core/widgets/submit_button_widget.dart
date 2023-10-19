import 'package:flutter/material.dart';
import 'package:jplay_flutter/core/theme/theme.dart';

class SubmitButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool loading;

  const SubmitButtonWidget({
    Key? key,
    this.onPressed,
    required this.buttonText,
    this.loading = false,
  }) : super(key: key);

  @override
  _SubmitButtonWidgetState createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    if (widget.loading) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant SubmitButtonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.loading != oldWidget.loading) {
      if (widget.loading) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SizedBox(
      width: _animatedWidth(context),
      height: 56,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: _buttonStyle(),
        child: _buttonChild(),
      ),
    );
  }

  double _animatedWidth(BuildContext context) {
    return (MediaQuery.of(context).size.width * (1 - _controller.value)) +
        (50 * _controller.value);
  }

  ButtonStyle _buttonStyle() {
    final borderRadius =
        BorderRadius.circular(10.0 + (40.0 * _controller.value));

    return ButtonStyle(
      elevation: MaterialStateProperty.all(1.0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppTheme.primaryColor.withOpacity(0.5);
          }
          return AppTheme.primaryColor;
        },
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 32.0 * (1 - _controller.value),
        ),
      ),
    );
  }

  Widget _buttonChild() {
    return Center(
      child: widget.loading
          ? const SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
