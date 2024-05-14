part of '../user.dart';

class UserCard extends StatelessWidget {
  const UserCard(this.data, {super.key});
  final UserCardData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300.0,
        width: context.width,
        constraints: const BoxConstraints(maxWidth: 300.0),
        decoration: BoxDecoration(color: context.color.surface),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.color.primary,
                      ),
                    ),
                  ),
                  DImage(
                    source: data.avatar,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        alignment: Alignment.center,
                        color: context.color.surface,
                        child: Icon(
                          Icons.broken_image,
                          color: context.color.primary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
