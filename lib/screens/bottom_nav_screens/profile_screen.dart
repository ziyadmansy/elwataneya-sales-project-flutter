import 'package:elwataneya_sales_app/providers/auth.dart';
import 'package:elwataneya_sales_app/providers/user_profile.dart';
import 'package:elwataneya_sales_app/utils/constants.dart';
import 'package:elwataneya_sales_app/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;
  bool _hasCrashed = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(errorMessage),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }

  Future<void> getProfileData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final userProfileData = Provider.of<UserProfile>(context, listen: false);
      await userProfileData.getProfileData();
      setState(() {
        _isLoading = false;
        _hasCrashed = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasCrashed = true;
      });
      _showErrorDialog(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);
    final userProfileData = Provider.of<UserProfile>(context, listen: false);
    return _isLoading
        ? Center(
            child: appLoader,
          )
        : _hasCrashed
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_outlined,
                      color: yellowColor,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      INTERNET_WARNING_MESSAGE,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    FlatButton(
                      onPressed: getProfileData,
                      child: const Text(
                        'Retry',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16.0,
                        ),
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6,
                          backgroundColor: Colors.grey,
                        ),
                        Text(
                          authData.name,
                          style: ktitleTextStyle,
                        ),
                        Text(
                          'مندوب مبيعات',
                          style: ksubtitleTextStyle,
                        ),
                        Divider(),
                        Text(
                          'التقرير اليومى',
                          style: ktitleTextStyle,
                        ),
                        Divider(
                          indent: MediaQuery.of(context).size.width / 4,
                          endIndent: MediaQuery.of(context).size.width / 4,
                        ),
                        CardTile(
                          title: 'مبيعات اليوم',
                          subtitle: ' / ',
                          leadingIcon: Icons.money_outlined,
                          trailingText: '0',
                        ),
                        CardTile(
                          title: 'الهدف اليومى',
                          subtitle:
                              '${userProfileData.dScore} / ${userProfileData.today}',
                          leadingIcon: Icons.show_chart,
                          trailingText: '${userProfileData.dPercent}%',
                        ),
                        CardTile(
                          title: 'الهدف الشهرى',
                          subtitle:
                              '${userProfileData.mScore} / ${userProfileData.month}',
                          leadingIcon: Icons.stacked_line_chart,
                          trailingText: '${userProfileData.mPercent}%',
                        ),
                        CardTile(
                          title: 'الزيارات',
                          subtitle:
                              '${userProfileData.vscore} / ${userProfileData.vTarget}',
                          leadingIcon: Icons.tour_outlined,
                          trailingText: '${userProfileData.vpercent}%',
                        ),
                        Divider(),
                        CardTile(
                          title: 'إجمالى مبيعات الشهر الحالى',
                          leadingIcon: Icons.leaderboard_outlined,
                          trailingText: '23142',
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
