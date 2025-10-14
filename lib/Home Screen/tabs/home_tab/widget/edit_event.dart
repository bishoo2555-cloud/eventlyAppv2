import 'package:eventlyapp/Home%20Screen/tabs/home_tab/widget/category_item.dart';
import 'package:eventlyapp/Home%20Screen/tabs/home_tab/widget/event_tab_item.dart';
import 'package:eventlyapp/Home%20Screen/tabs/widgets/custom_elevated_button.dart';
import 'package:eventlyapp/Home%20Screen/tabs/widgets/custom_textformfiled.dart';
import 'package:eventlyapp/add%20event/widget/add_Time&Date.dart';
import 'package:eventlyapp/firebase/add_event_moder.dart';
import 'package:eventlyapp/firebase/firebase_utils.dart';
import 'package:eventlyapp/generated/l10n.dart';
import 'package:eventlyapp/utils/app_assets.dart';
import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<EditEvent> {
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectTime;
  String? formatTime;
  var formKey = GlobalKey<FormState>();
  late EventModel event;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is EventModel) {
        event = args;
        titleController.text = event.title;
        describtionController.text = event.decription;
        selectedDate = event.eventdateTime;
        formatTime = (event.eventTime.isNotEmpty) ? event.eventTime : null;
        if (formatTime != null) {
          try {
            final dt = DateFormat.jm().parse(formatTime!);
            selectTime = TimeOfDay(hour: dt.hour, minute: dt.minute);
          } catch (e) {
            selectTime = TimeOfDay(
                hour: selectedDate?.hour ?? 0,
                minute: selectedDate?.minute ?? 0);
          }
        }
        final categories = CategoryModel.getCategories(context);
        final idx = categories.indexWhere(
            (c) => c.id == event.categoryId || c.name == event.eventName);
        selectedIndex = (idx >= 0) ? idx : 0;
      } else {
        final categories = CategoryModel.getCategories(context);
        selectedIndex = 0;
        event = EventModel(
          id: '',
          title: '',
          decription: '',
          eventName: categories[0].name,
          eventdateTime: DateTime.now(),
          eventImage: categories[0].imagePath ?? '',
          eventTime: '',
          categoryId: categories[0].id,
        );
      }
      _initialized = true;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    describtionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final categories = CategoryModel.getCategories(context);
    final selectedCategory = categories[selectedIndex];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppColor.primaryLightColor),
        backgroundColor: Colors.transparent,
        title: Text(
          'Edit event',
          style: AppStyle.reglur22Primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.018),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  width: double.infinity,
                  child: (selectedCategory.imagePath != null &&
                          selectedCategory.imagePath!.isNotEmpty)
                      ? Image.asset(
                          selectedCategory.imagePath!,
                          fit: BoxFit.cover,
                          cacheWidth: (width * 0.94).round(),
                          cacheHeight: (height * 0.25).round(),
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(selectedCategory.iconData, size: 50),
                        )
                      : const SizedBox.shrink(),
                ),
                SizedBox(height: height * 0.02),
                DefaultTabController(
                  length: categories.length,
                  child: TabBar(
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: width * 0.02),
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    tabs: categories
                        .map((category) => EventTabItem(
                              isSelected:
                                  selectedIndex == categories.indexOf(category),
                              selectedBgColor: AppColor.primaryLightColor,
                              selectedFgColor: Theme.of(context).splashColor,
                              unSelectedBgColor: Colors.transparent,
                              unSelectedFgColor: AppColor.primaryLightColor,
                              category: category,
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(S.of(context).title,
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: height * 0.01),
                    CustomTextformfiled(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Title";
                        }
                        return null;
                      },
                      hintText: S.of(context).eventTitle,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          AppAssets.titleIcon,
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                      controller: titleController,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(S.of(context).describtion,
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: height * 0.01),
                    CustomTextformfiled(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Description";
                        }
                        return null;
                      },
                      maxLines: 5,
                      hintText: S.of(context).eventDescription,
                      controller: describtionController,
                    ),
                    SizedBox(height: height * 0.02),
                    AddTime_date(
                      iconPath: AppAssets.dateIcon,
                      text: S.of(context).eventDate,
                      choose_timeOrdate: selectedDate == null
                          ? S.of(context).chooseDate
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      onChooseEventDateOrTime: chooseDate,
                    ),
                    SizedBox(height: height * 0.01),
                    AddTime_date(
                      iconPath: AppAssets.timeIcon,
                      text: S.of(context).eventTime,
                      choose_timeOrdate: selectTime == null
                          ? S.of(context).chooseTime
                          : formatTime ?? selectTime!.format(context),
                      onChooseEventDateOrTime: chooseTime,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(S.of(context).location,
                        style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: height * 0.01),
                    CustomElevatedButton(
                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                      borderColor: AppColor.primaryLightColor,
                      onPressed: () {},
                      hasIcon: true,
                      hasSuffix: true,
                      backgroundColor: Colors.transparent,
                      iconWidget: Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColor.primaryLightColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.my_location_outlined,
                          size: 29,
                          color: Theme.of(context).splashColor,
                        ),
                      ),
                      text: S.of(context).chooseEventLocation,
                      textStyle: AppStyle.medium16Primary,
                      iconWidgetSuf: Icon(Icons.arrow_forward_ios_outlined,
                          color: AppColor.primaryLightColor),
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedButton(
                      onPressed: () {
                        saveEdit(context);
                        Navigator.pop(context);
                      },
                      text: 'Edit',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: selectedDate ?? DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      setState(() {});
    }
  }

  void chooseTime() async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: selectTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      selectTime = pickedTime;
      formatTime = selectTime!.format(context);
      setState(() {});
    }
  }

  void saveEdit(BuildContext context) async {
    if (formKey.currentState?.validate() != true || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields')));
      return;
    }

    final categories = CategoryModel.getCategories(context);
    final selectedCategory = categories[selectedIndex];

    final updatedEvent = EventModel(
      id: event.id,
      title: titleController.text.trim(),
      decription: describtionController.text.trim(),
      eventName: selectedCategory.name,
      eventdateTime: DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectTime?.hour ?? event.eventdateTime.hour,
        selectTime?.minute ?? event.eventdateTime.minute,
      ),
      eventImage: selectedCategory.imagePath ?? '',
      eventTime: formatTime ?? '',
      isFav: event.isFav,
      categoryId: selectedCategory.id,
    );

    try {
      if (updatedEvent.id.isEmpty) {
        final collection = FireBaseUtils.getEvent();
        final docRef = collection.doc();
        updatedEvent.id = docRef.id;
        await docRef.set(updatedEvent);
      } else {
        await FireBaseUtils.getEvent().doc(updatedEvent.id).set(updatedEvent);
      }
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to update event: $e')));
    }
  }
}
