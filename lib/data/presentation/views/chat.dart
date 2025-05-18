import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_freelancing_hub/constants.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';
import 'package:iti_freelancing_hub/data/presentation/manger/cubit/chat/chat_cubit_cubit.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/chat_buble.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/custom_app_bar.dart';
import 'package:iti_freelancing_hub/data/presentation/widgets/text_field.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});
  static const routeName = '/chat';

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _usernameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ChatCubitCubit>().fetchChat();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Chat with Admin',
            backText: 'Back',
            onBackPressed: () {
              Navigator.of(context).pop();
            },
            showPendingButton: false,
          ),
          Expanded(
            child: BlocBuilder<ChatCubitCubit, ChatCubitState>(
              builder: (context, state) {
                if (state is ChatLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: kColors[0]),
                  );
                } else if (state is ChatLoaded) {
                  final messages = state.messages;

                  if (messages.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Welcome! If you have any questions or problems, feel free to chat with our admin here. '
                          'Just type your message below, and we’ll get back to you as soon as possible. We\'re here to help!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    );
                  }

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollController.jumpTo(
                      _scrollController.position.maxScrollExtent,
                    );
                  });

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return ChatBuble(
                        message: msg.content,
                        isSender: msg.isSender,
                        timestamp: msg.timestamp,
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return Center(child: Text('Error: ${state.error}'));
                }
                return const SizedBox();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFiled(
                    hittext: 'Ask about anything ... ',
                    controller: _usernameController,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    final text = _usernameController.text.trim();
                    if (text.isNotEmpty) {
                      context.read<ChatCubitCubit>().sendMessage(text);
                      _usernameController.clear();
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kColors[0],
                    ),
                    child: Icon(Icons.send, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
