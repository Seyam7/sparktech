import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sparktech_flutter/screens/home_screen.dart';

class PersonalizingCourseScreen extends StatefulWidget {
  const PersonalizingCourseScreen({super.key});

  @override
  State<PersonalizingCourseScreen> createState() => _PersonalizingCourseScreenState();
}

class _PersonalizingCourseScreenState extends State<PersonalizingCourseScreen> {
  String _currentGrade = 'Primary 5';
  String _referralSource = 'Friends';

  final List<String> _gradeOptions = [
    'Primary 1',
    'Primary 2',
    'Primary 3',
    'Primary 4',
    'Primary 5',
    'Primary 6',
    'From 1',
    'From 2',
    'From 3',
    'From 4',
    'From 5',
    'From 6',

  ];

  final List<String> _referralOptions = [
    'Instagram',
    'Medium',
    'Threads',
    'Friends',
    'School',
    'Teacher',
    'Others',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(24),
          //color: Colors.white,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Personalizing course according to your profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),

                const Text('Current School'),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Diocesan Boy\'s School',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Elective Subject'),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Diocesan Boy\'s School',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Current Grade'),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _currentGrade,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      border: InputBorder.none,
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: _gradeOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _currentGrade = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text('How Did You Hear About Us?'),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: _referralSource,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      border: InputBorder.none,
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: _referralOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                            value,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _referralSource = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                //Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(),),);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
