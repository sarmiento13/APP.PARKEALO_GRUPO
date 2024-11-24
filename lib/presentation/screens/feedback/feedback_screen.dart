import 'package:flutter/material.dart';

import 'emoticon.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int? selected;
  final commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  final List<Emoticon> emoticons = [
    Emoticon(
      icon: "assets/emoji/rage.gif",
      quick: "Enojado",
    ),
    Emoticon(
      icon: "assets/emoji/monocle.gif",
      quick: "Observo",
    ),
    Emoticon(
      icon: "assets/emoji/joy.gif",
      quick: "Divierte",
    ),
    Emoticon(
      icon: "assets/emoji/holding.gif",
      quick: "Ojitos",
    ),
    Emoticon(
      icon: "assets/emoji/smile.gif",
      quick: "Genial",
    ),
  ];

  Future<void> submitFeedback() async {
    FocusScope.of(context).unfocus();
    if (selected != null || commentController.text.trim().isNotEmpty) {
      print(commentController.text.trim());
      // await FirebaseFirestore.instance.collection('feedbacks').add({
      //   'emoticon': emoticons[selected!],
      //   'comment': commentController.text,
      //   'timestamp': Timestamp.now(),
      // });

      setState(() {
        selected = null;
      });
      commentController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Se envió con éxito su feedback'),
          duration: Duration(milliseconds: 1500),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seleccione un emoticon o escriba un comentario.'),
          duration: Duration(milliseconds: 1500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¿Cómo calificarías esta aplicación?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const Text(
                  'Tu opinión es importante para nosotros. Elige el emoticono que mejor refleje tu experiencia y ayúdanos a mejorar.'),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: List.generate(
                      emoticons.length,
                      (index) {
                        return selected == index
                            ? Badge(
                                label: Text(emoticons[index].quick),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                alignment: Alignment.topCenter,
                                child: ClipOval(
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (selected == index) {
                                          selected = null;
                                        } else {
                                          selected = index;
                                        }
                                      });
                                    },
                                    highlightColor:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      decoration: selected == index
                                          ? BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            )
                                          : null,
                                      child: Image.asset(
                                        emoticons[index].icon,
                                        width: 60,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ClipOval(
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = index;
                                    });
                                  },
                                  highlightColor:
                                      Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    decoration: selected == index
                                        ? BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )
                                        : null,
                                    child: Image.asset(
                                      emoticons[index].icon,
                                      width: 60,
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                '¿Cómo fue tu experiencia?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const Text(
                  'Queremos hacer esta app perfecta para ti. Comparte cualquier idea, problema o comentario que tengas.'),
              const SizedBox(height: 24),
              TextField(
                controller: commentController,
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: 'Agrega un comentario...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const Spacer(),
              FilledButton(
                onPressed:
                    selected != null || commentController.text.trim().isNotEmpty
                        ? () => submitFeedback()
                        : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Enviar ahora'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
