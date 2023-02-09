enum DayOfWeekEnum {
  sunday(weekDay: DateTime.sunday),
  monday(weekDay: DateTime.monday),
  tuesday(weekDay: DateTime.tuesday),
  wednesday(weekDay: DateTime.wednesday),
  thursday(weekDay: DateTime.thursday),
  friday(weekDay: DateTime.friday),
  saturday(weekDay: DateTime.saturday);

  const DayOfWeekEnum({required this.weekDay});

  final int weekDay;

  static DayOfWeekEnum getByWeekDay(int weekDay) {
    return DayOfWeekEnum.values.firstWhere((e) => e.weekDay == weekDay);
  }
}
