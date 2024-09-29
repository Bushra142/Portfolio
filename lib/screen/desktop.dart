import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/data/Projectdata.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  _DesktopScreenState createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for sections
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Method to scroll to the respective section
  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Section
                _buildHeader(screenWidth),
                // Main Content
                SizedBox(
                  height: 350,
                  width: screenWidth * 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildInfoCard(screenWidth),
                          const Gap(20),
                          _buildImageCard(),
                        ],
                      ),
                    ),
                  ),
                ),
                // About Section
                _buildAboutSection(),
                const Gap(20),
                const Text(
                  'Projects',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
                  child: _buildProjectsGrid(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 40, 80, 0),
                  child: _buildSkillsAndEducation(),
                ),
                // Contact Us Section
                _buildContactUsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double screenWidth) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 182, 152, 141),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Bushra Aslam',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Gap(10),
          const Text(
            'Flutter Developer',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () =>
                    _scrollToSection(_aboutKey), // Scroll to "About Me"
                child: const Text(
                  'About Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Gap(10),
              TextButton(
                onPressed: () =>
                    _scrollToSection(_projectsKey), // Scroll to "Projects"
                child: const Text(
                  'Projects',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Gap(10),
              TextButton(
                onPressed: () =>
                    _scrollToSection(_contactKey), // Scroll to "Contact Us"
                child: const Text(
                  'Contact',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(double screenWidth) {
    return Card(
      color: Colors.white70,
      shadowColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              'I’m Bushra Aslam a Flutter\n Developer from DIK',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10),
            Text(
              'Skilled Flutter developer with expertise\n in building responsive and high-performance\n mobile applications. Proficient in Dart, with a \nstrong focus on clean code and user-friendly\n interfaces.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard() {
    return SizedBox(
      width: 300, // Adjust as needed
      height: 400,
      child: Card(
        color: Colors.white70,
        shadowColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: Image.asset('assets/images/cover.jpeg'),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      key: _aboutKey, // Key for About Section
      padding: const EdgeInsets.fromLTRB(80, 20, 80, 10),
      child: Card(
        color: Colors.white70,
        shadowColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            _buildImageGrid(),
            const Gap(50),
            _buildAboutMeText(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    // List of image paths
    List<String> imagePaths = [
      'assets/images/2.jpg',
      'assets/images/1.jpg',
      'assets/images/3.jpeg',
      'assets/images/4.jpeg',
      'assets/images/5.jpeg',
      'assets/images/6.jpeg',
    ];

    return Column(
      children: List.generate(3, (rowIndex) {
        return Row(
          children: List.generate(2, (colIndex) {
            // Calculate the image index based on row and column
            int imageIndex = rowIndex * 2 + colIndex;

            return Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.only(left: 40, bottom: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      imagePaths[imageIndex]), // Pick different image
                  fit: BoxFit.cover, // Ensure the image fits well
                ),
                borderRadius:
                    BorderRadius.circular(10), // Optional: Rounded corners
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildAboutMeText() {
    return const Expanded(
      child: Column(
        children: [
          Text(
            'I have been developing apps using\n flutter for more than 1.5 months',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(10),
          Text(
            'I specialize in building sleek, high-performance applications\n using Flutter. My focus is on creating user-centric, intuitive,\n and aesthetically pleasing apps that run seamlessly across\n platforms. I enjoy solving complex challenges and continuously\n learning new techniques to improve my craft.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid() {
    return SizedBox(
      key: _projectsKey, // Key for Projects Section
      height: 500,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: constraints.maxWidth /
                  (MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 3),
            ),
            itemCount: projectlist.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white70,
                shadowColor: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    const Gap(20),
                    Text(
                      projectlist[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                        width: 180,
                        height: 180,
                        child: Image.asset(projectlist[index].imageURL)),
                    const Gap(20),
                    Text(
                      projectlist[index].description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSkillsAndEducation() {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Expanded(
            child: _buildSkillsCard(),
          ),
          Expanded(
            child: _buildEducationCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCard() {
    return Card(
      color: Colors.white70,
      shadowColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'My skills',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Gap(15), // Reduced gap
            _buildSkillItem(Icons.flutter_dash, 'Flutter'),
            _buildSkillItem(Icons.code, 'Dart'),
            _buildSkillItem(Icons.design_services, 'UI/UX Design'),
            _buildSkillItem(Icons.html_rounded, 'Html'),
            _buildSkillItem(Icons.wordpress, 'Wordpress'),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillItem(IconData icon, String skill) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Gap(30),
          Icon(icon),
          const Gap(10),
          Text(
            skill,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard() {
    return Card(
      color: Colors.white70,
      shadowColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Education',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            _buildEducationItem(
                'BS (Hons) Computer Science \nUniversity of Management and Technology(UMT)'),
            const Gap(20),
            _buildEducationItem(
                'Intermediate (ICS) \nThe knowledge Home School and College'),
            const Gap(20),
            _buildEducationItem(
                'Matriculation\nThe Knowledge Home School and College'),
          ],
        ),
      ),
    );
  }

  static Widget _buildEducationItem(String education) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Gap(30),
          const Icon(Icons.school),
          const Gap(10),
          Text(
            education,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildContactUsSection() {
    return Container(
      key: _contactKey, // Key for Contact Us Section
      padding: const EdgeInsets.fromLTRB(80, 20, 80, 40),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.white70,
          shadowColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/touch.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50)),
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    'Let\'s Get in Touch',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Gap(20),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.link),
                      Gap(10),
                      Text(
                        'https://www.linkedin.com/in/bushra-aslam-19b356245/ ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_rounded),
                      Gap(10),
                      Text(
                        ' aslambushra142@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mobile_friendly),
                      Gap(10),
                      Text(
                        ' +923341164854',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined),
                      Gap(10),
                      Text(
                        ' Dera Ismail Khan, Pakistan',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
