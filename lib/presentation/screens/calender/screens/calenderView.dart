// ignore_for_file: must_be_immutable

import 'package:calender/core/constants.dart';
import 'package:calender/core/theming/colors.dart';
import 'package:calender/presentation/screens/calender/widget/CustomCalnderViewWidget.dart';
import 'package:calender/presentation/screens/calender/widget/meeting.dart';
import 'package:calender/presentation/screens/calender/widget/meetingDataSource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({super.key, required this.contextt});
  BuildContext contextt;
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  bool _isScheduleSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backGroungColor,
      body: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(.3),
          ),
          SizedBox(
            height: 24.h,
          ),
          _buildHeader(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
            ),
            child: SizedBox(
              height: 80.h,
              child: _buildDateSlider(),
            ),
          ),
          _buildToggleButtons(),
          Expanded(
            child: _isScheduleSelected
                ? buildScheduleSection()
                : _buildTaskSection(),
          ),
        ],
      ),
    );
  }

  // Widgets

  // Header Section
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => ShowBottomSheet(widget.contextt),
            child: Text(
              '${_getMonthAbbreviation(_selectedDate.month)} ${_selectedDate.year}',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
              onTap: () => ShowBottomSheet(widget.contextt),
              child: SvgPicture.asset('assets/images/arrow-down.svg')),
          const Spacer(),
          _buildMonthNavigationButton(Icons.chevron_left, () {
            setState(() {
              _selectedDate = DateTime(
                _selectedDate.year,
                _selectedDate.month - 1,
                1,
              );
            });
          }),
          SizedBox(
            width: 8.w,
          ),
          _buildMonthNavigationButton(Icons.chevron_right, () {
            setState(() {
              _selectedDate = DateTime(
                _selectedDate.year,
                _selectedDate.month + 1,
                1,
              );
            });
          }),
        ],
      ),
    );
  }

  // Month Navigation Button

  Widget _buildMonthNavigationButton(IconData icon, VoidCallback onTap) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        border: Border.all(
          color: Colors.grey,
          width: 1.5.w,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon),
      ),
    );
  }

  // Date Slider

  Widget _buildDateSlider() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 30,
      itemBuilder: (context, index) {
        DateTime date = DateTime.now().add(Duration(days: index));
        bool isSelected = date.day == _selectedDate.day &&
            date.month == _selectedDate.month &&
            date.year == _selectedDate.year;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
          child: Container(
            width: 60.w,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _getDayOfWeek(date.weekday),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Toggle Buttons (Schedule and Task)
  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildToggleButton('Schedule', _isScheduleSelected, () {
          setState(() {
            _isScheduleSelected = true;
          });
        }),
        SizedBox(width: 20.w),
        buildToggleButton('Task', !_isScheduleSelected, () {
          setState(() {
            _isScheduleSelected = false;
          });
        }),
      ],
    );
  }

  // Schedule Section  Days of the week
  Widget buildScheduleSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
      ),
      child: Container(
        color: Colors.white,
        child: Expanded(
          child: SfCalendar(
            backgroundColor: Colors.white, // Change the color of the calendar
            showCurrentTimeIndicator: true,
            showDatePickerButton: false,
            view: CalendarView.day,
            dataSource: MeetingDataSource(_getDataSource()),
            todayHighlightColor: Colors.black,
            initialDisplayDate: _selectedDate,
            headerHeight: 0,
            viewHeaderStyle: const ViewHeaderStyle(
              dateTextStyle: TextStyle(color: Colors.transparent),
            ),
            appointmentBuilder:
                (BuildContext context, CalendarAppointmentDetails details) {
              final Meeting meeting = details.appointments.first;
              return CustomCalnderViewWidget(meeting: meeting);
            },
            timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 6,
              endHour: 24,
              timeIntervalHeight: 70,
              timeIntervalWidth: -1,
              timeRulerSize: 50,
              timelineAppointmentHeight: 70,
            ),

            monthCellBuilder: (context, details) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(details.date.day.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Task Section
  List<String> title = [
    'Meeting Concept',
    'Information Architecture',
    'Monitoring Project',
    'Daily Standup'
  ];
  List<String> descrptions = [
    'Due Date : WED, 12 Jan 2024',
    'Due Date : THU, 12 Jan 2024',
    'Due Date : FRI, 12 Jan 2024',
    'Due Date : SAT, 12 Jan 2024'
  ];
  Widget _buildTaskSection() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: title.length, // Example task count
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.08),
                  blurRadius: 24,
                  offset: Offset(4, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title[index],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      descrptions[index],
                      style: TextStyle(
                        color: ColorsManager.textColormin,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/images/tick-square.svg',
                  width: 24.h,
                  height: 24.h,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // Calendar Data Source
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = _selectedDate;
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 1));
    meetings.add(Meeting(
      'Sprint Review Period 02 in May',
      startTime,
      endTime,
      ColorsManager.colorcalnder1,
      ColorsManager.colorcalnderFoshia,
      false,
    ));
    meetings.add(Meeting(
      'Meeting with Client',
      DateTime(today.year, today.month, today.day, 11, 0, 0),
      DateTime(today.year, today.month, today.day, 12, 0, 0),
      ColorsManager.colorcalnder2,
      ColorsManager.colorcalnderOrange,
      false,
    ));
    meetings.add(Meeting(
      'Daily Standup',
      DateTime(today.year, today.month, today.day, 12, 0, 0),
      DateTime(today.year, today.month, today.day, 13, 0, 0),
      ColorsManager.colorcalnder3,
      ColorsManager.colorcalnderGreen,
      false,
    ));
    return meetings;
  }

  // Helper Functions
  String _getDayOfWeek(int weekday) {
    const List<String> weekdays = [
      'SUN',
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT'
    ];
    return weekdays[weekday % 7];
  }

  String _getMonthAbbreviation(int month) {
    const List<String> monthAbbreviations = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthAbbreviations[month - 1];
  }
}
