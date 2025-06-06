import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_theme.dart';
import 'package:dot_ai_app/core/design_system/buttons/control_button.dart';
import 'package:dot_ai_app/core/design_system/icons/keyboard_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/mic_off_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/mic_on_icon.dart';
import 'package:flutter/material.dart';

enum InputMode { voice, text }

class InputPanel extends StatefulWidget {
  const InputPanel({super.key, required this.onPromptSubmitted});

  final ValueChanged<String> onPromptSubmitted;

  @override
  State<InputPanel> createState() => _InputPanelState();
}

class _InputPanelState extends State<InputPanel> {
  InputMode _mode = InputMode.voice;

  @override
  Widget build(BuildContext context) {
    return switch (_mode) {
      InputMode.voice => _VoiceInput(
        onInputModeChanged: () {
          setState(() {
            _mode = InputMode.text;
          });
        },
        onPromptSubmitted: widget.onPromptSubmitted,
      ),
      InputMode.text => _TextInput(
        onInputModeChanged: () {
          setState(() {
            _mode = InputMode.voice;
          });
        },
        onPromptSubmitted: widget.onPromptSubmitted,
      ),
    };
  }
}

class _VoiceInput extends StatelessWidget {
  const _VoiceInput({
    required this.onInputModeChanged,
    required this.onPromptSubmitted,
  });

  final VoidCallback onInputModeChanged;
  final ValueChanged<String> onPromptSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ControlButton(onPressed: () {}, child: const MicOffIcon()),
        ControlButton(
          onPressed: () => onPromptSubmitted("Lorem ipsum"),
          padding: 16.0,
          gradient: AppTheme.primaryMicGradient,
          child: const MicOnIcon(color: AppColors.surface),
        ),
        ControlButton(
          onPressed: onInputModeChanged,
          child: const KeyboardIcon(),
        ),
      ],
    );
  }
}

class _TextInput extends StatefulWidget {
  const _TextInput({
    required this.onInputModeChanged,
    required this.onPromptSubmitted,
  });

  final VoidCallback onInputModeChanged;
  final ValueChanged<String> onPromptSubmitted;

  @override
  State<_TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<_TextInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Row(
        children: [
          if (!_isKeyboardVisible) ...{
            IconButton(
              style: OutlinedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: AppColors.surface,
                side: BorderSide.none,
              ),
              onPressed: widget.onInputModeChanged,
              icon: const MicOnIcon(),
            ),
            const SizedBox(width: 4.0),
          },
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onTapOutside: (_) {
                        _focusNode.unfocus();
                      },
                      decoration: InputDecoration(
                        hintText: 'Write your message here...',
                        hintStyle: TextStyle(color: AppColors.mutedText),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                      ),
                      maxLines: 5,
                      minLines: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        widget.onPromptSubmitted(_controller.text.trim());
                        _controller.clear();
                      }
                    },
                    icon: const Icon(Icons.send),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
