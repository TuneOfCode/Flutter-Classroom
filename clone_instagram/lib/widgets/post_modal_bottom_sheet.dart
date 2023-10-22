import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostModalBottomSheetWidget extends StatefulWidget {
  final bool isHideShareAndLink;
  const PostModalBottomSheetWidget({
    super.key,
    this.isHideShareAndLink = false,
  });

  @override
  State<PostModalBottomSheetWidget> createState() =>
      _PostModalBottomSheetWidgetState();
}

class _PostModalBottomSheetWidgetState
    extends State<PostModalBottomSheetWidget> {
  bool _isHideShareAndLink = false;

  @override
  void initState() {
    super.initState();
    _isHideShareAndLink = widget.isHideShareAndLink;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.68,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(32, 32, 32, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.horizontal_rule_rounded,
              color: Colors.white70,
              size: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        child: SvgPicture.asset(
                          'assets/images/bookmark.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                          width: 30,
                          height: 30,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Lưu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.qr_code_scanner_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Mã QR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.white10,
              height: 1,
            ),
            Expanded(
              child: ListView(
                children: [
                  if (!_isHideShareAndLink) ...[
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/images/share.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                        width: 28,
                        height: 28,
                      ),
                      title: const Text(
                        'Chúng tôi có một số thay đổi!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        'Xem nơi để chia sẻ và liên kết',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 14,
                        ),
                        onPressed: () {
                          setState(() {
                            _isHideShareAndLink = true;
                          });
                        },
                      ),
                    ),
                  ] else ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(),
                    ),
                  ],
                  const Divider(
                    color: Colors.white10,
                    height: 1,
                  ),
                  const ListTile(
                    leading: Icon(Icons.star_border_outlined),
                    title: Text('Thêm vào mục Yêu thích'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person_remove_alt_1_outlined),
                    title: Text('Bỏ theo dõi'),
                  ),
                  const Divider(
                    color: Colors.white10,
                    height: 1,
                  ),
                  const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('Lý do bạn nhìn thấy bài viết này'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.remove_circle_outline_sharp),
                    title: Text('Ẩn'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text('Giới thiệu về tài khoản này'),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.report_outlined,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Báo cáo',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
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
