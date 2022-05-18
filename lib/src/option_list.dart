part of flutter_mentions;

class OptionList extends StatelessWidget {
  const OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.suggestionListDecoration,
    Key? key,
  }) : super(key: key);

  final Widget Function(MentionData)? suggestionBuilder;
  final List<MentionData> data;
  final Function(MentionData) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            decoration: suggestionListDecoration ??
                const BoxDecoration(color: Colors.white),
            constraints: BoxConstraints(
              maxHeight: suggestionListHeight,
            ),
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onTap(data[index]);
                  },
                  child: suggestionBuilder != null
                      ? suggestionBuilder!(data[index])
                      : Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            data[index].display,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                );
              },
            ),
          )
        : Container();
  }
}
