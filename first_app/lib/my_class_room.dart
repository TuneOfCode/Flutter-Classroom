import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> popupMenusInAppBar = [
      'Làm mới',
      'Gửi ý kiến phản hồi cho Google'
    ];

    final List<String> popupItemsClassroom = ['Huỷ đăng ký'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.5,
        title: const Text(
          'Google Lớp học',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => Dialog(
                backgroundColor: Colors.blue[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 5, left: 10),
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, left: 55),
                            child: const Image(
                                image:
                                    AssetImage('assets/images/logo_google.png'),
                                width: 80),
                          ),
                        ],
                      ),
                      // const Divider(
                      //   height: 10,
                      //   thickness: 1,
                      //   indent: 1,
                      //   endIndent: 1,
                      // ),
                      // Container(
                      //   padding: const EdgeInsets.all(10),
                      // ),
                      Expanded(
                        child: Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            height: 400,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'Chọn tài khoản',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            icon: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Theme(
            data: ThemeData.light(),
            child: PopupMenuButton(
              itemBuilder: (_) => popupMenusInAppBar
                  .map((e) => PopupMenuItem(
                      child: Text(e,
                          style: const TextStyle(
                            fontSize: 16,
                          ))))
                  .toList(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            // const DrawerHeader(
            //   child: Text(
            //     'Google Lớp học',
            //     style: TextStyle(fontSize: 20),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: const ListTile(
                leading: Image(
                    image: AssetImage('assets/images/logo_google.png'),
                    width: 80),
                title: Text(
                  'Lớp học',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 1,
              endIndent: 1,
            ),
            ListTile(
              onTap: () => {
                Navigator.pop(context),
              },
              leading: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 6, 102, 180),
                size: 30,
              ),
              title: const Text(
                'Lớp học',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 6, 102, 180)),
              ),
            ),
            ListTile(
              onTap: () => {
                Navigator.pop(context),
              },
              leading: const Icon(
                Icons.calendar_today,
                size: 30,
              ),
              title: const Text(
                'Lịch',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () => {
                Navigator.pop(context),
              },
              leading: const Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
              title: const Text(
                'Thông báo',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListBody(
              children: [
                const Divider(
                  height: 10,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Đã đăng ký',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: const Icon(
                    Icons.fact_check_outlined,
                    size: 30,
                  ),
                  title: const Text(
                    'Việc cần làm',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thực tập niên luận - Nhóm 19',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.2.TIN3142.019',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Java nâng cao_Nhóm 1',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Text(
                      //   '',
                      //   style: TextStyle(
                      //       fontSize: 16,
                      //       overflow: TextOverflow.ellipsis,
                      //       color: Colors.black54),
                      // )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.1.TIN3113.001',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.1.TIN3113.001',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.1.TIN3113.001',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.1.TIN3113.001',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.1.TIN3113.001',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.1.TIN3113.001',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '2022-2023.1.TIN3113.001',
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListBody(children: [
              const Divider(
                height: 10,
                thickness: 1,
                indent: 1,
                endIndent: 1,
              ),
              ListTile(
                onTap: () => {
                  Navigator.pop(context),
                },
                leading: const Icon(
                  Icons.offline_pin_outlined,
                  size: 30,
                ),
                title: const Text(
                  'Tệp ngoại tuyến',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () => {
                  Navigator.pop(context),
                },
                leading: const Icon(
                  Icons.archive_outlined,
                  size: 30,
                ),
                title: const Text(
                  'Lớp học đã lưu trữ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () => {
                  Navigator.pop(context),
                },
                leading: const Icon(
                  Icons.folder_outlined,
                  size: 30,
                ),
                title: const Text(
                  'Thư mục lớp học',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () => {
                  Navigator.pop(context),
                },
                leading: const Icon(
                  Icons.settings_outlined,
                  size: 30,
                ),
                title: const Text(
                  'Cài đặt',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () => {
                  Navigator.pop(context),
                },
                leading: const Icon(
                  Icons.help_outline,
                  size: 30,
                ),
                title: const Text(
                  'Trợ giúp',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ])
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(1),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'Tuần này',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        ButtonBar(
                          children: [
                            TextButton(
                              onPressed: () => {},
                              child: Text(
                                'Xem danh sách việc cần làm',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue[900],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          'Hiện không có bài tập nào',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/bg_item_1.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    'Thực tập viết niên luận - Nhóm 19',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                PopupMenuButton(
                                  itemBuilder: (_) => popupItemsClassroom
                                      .map(
                                        (e) => PopupMenuItem(
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  color: Colors.white,
                                  offset: const Offset(0, 50),
                                ),
                              ],
                            ),
                            const Text(
                              '2022-2023.2.TIN3142.019',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Phong Trần Nguyên',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/bg_item_2.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    'Java nâng cao_Nhóm 1',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                PopupMenuButton(
                                  itemBuilder: (_) => popupItemsClassroom
                                      .map(
                                        (e) => PopupMenuItem(
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  color: Colors.white,
                                  offset: const Offset(0, 50),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Hà Nguyễn Hoàng',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/bg_item_3.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1,
                                  ),
                                ),
                                PopupMenuButton(
                                  itemBuilder: (_) => popupItemsClassroom
                                      .map(
                                        (e) => PopupMenuItem(
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  color: Colors.white,
                                  offset: const Offset(0, 50),
                                ),
                              ],
                            ),
                            const Text(
                              '2022-2023.1.TIN3113.001',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Phước Đoàn Thị Hồng',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/bg_item_3.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1,
                                  ),
                                ),
                                PopupMenuButton(
                                  itemBuilder: (_) => popupItemsClassroom
                                      .map(
                                        (e) => PopupMenuItem(
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  color: Colors.white,
                                  offset: const Offset(0, 50),
                                ),
                              ],
                            ),
                            const Text(
                              '2022-2023.1.TIN3113.001',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Phước Đoàn Thị Hồng',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/bg_item_3.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1,
                                  ),
                                ),
                                PopupMenuButton(
                                  itemBuilder: (_) => popupItemsClassroom
                                      .map(
                                        (e) => PopupMenuItem(
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  color: Colors.white,
                                  offset: const Offset(0, 50),
                                ),
                              ],
                            ),
                            const Text(
                              '2022-2023.1.TIN3113.001',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Phước Đoàn Thị Hồng',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/bg_item_3.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Flexible(
                                  child: Text(
                                    '[2022-2023.1] Nhập môn trí tuệ nhân tạo',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1,
                                  ),
                                ),
                                PopupMenuButton(
                                  itemBuilder: (_) => popupItemsClassroom
                                      .map(
                                        (e) => PopupMenuItem(
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  color: Colors.white,
                                  offset: const Offset(0, 50),
                                ),
                              ],
                            ),
                            const Text(
                              '2022-2023.1.TIN3113.001',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Phước Đoàn Thị Hồng',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (_) => Container(
                    height: 120,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: const Text(
                              'Tạo lớp học',
                              style: TextStyle(fontSize: 18),
                            ),
                            onTap: () => {
                              Navigator.pop(context),
                            },
                          ),
                          ListTile(
                            title: const Text(
                              'Tham gia lớp học',
                              style: TextStyle(fontSize: 18),
                            ),
                            onTap: () => {
                              Navigator.pop(context),
                            },
                          )
                        ]),
                  ))
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[900],
        shape: const CircleBorder(
          side: BorderSide(color: Colors.transparent, width: 2),
          eccentricity: 1,
        ),
        child: Icon(
          Icons.add,
          color: Colors.blue[900],
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
