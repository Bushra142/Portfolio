import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/data/Projectdata.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final ScrollController scrollController = ScrollController();

  // GlobalKeys for sections
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // Method to scroll to the respective section
  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenheight,
        constraints: const BoxConstraints(
          minHeight: 560.0,
        ),
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Section
                buildHeader(screenWidth),
                // Main Content
                SizedBox(
                  height: 950,
                  width: screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: [
                          buildInfoCard(screenWidth),
                          const Gap(20),
                          buildImageCard(),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                // About Section
                Center(child: buildAboutSection()),
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
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: buildProjectsGrid(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: buildSkillsAndEducation(),
                ),
                // Contact Us Section
                buildContactUsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(double screenWidth) {
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
                    scrollToSection(aboutKey), // Scroll to "About Me"
                child: const Text(
                  'About Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Gap(10),
              TextButton(
                onPressed: () =>
                    scrollToSection(projectsKey), // Scroll to "Projects"
                child: const Text(
                  'Projects',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Gap(10),
              TextButton(
                onPressed: () =>
                    scrollToSection(contactKey), // Scroll to "Contact Us"
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

  Widget buildInfoCard(double screenWidth) {
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

  Widget buildImageCard() {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Adjust as needed
      height: 400,
      child: Card(
        color: Colors.white70,
        shadowColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset('assets/images/cover.jpeg'),
      ),
    );
  }

  Widget buildAboutSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      key: aboutKey, // Key for About Section
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Card(
        color: Colors.white70,
        shadowColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            const Gap(20),
            buildImageGrid(),
            const Gap(50),
            buildAboutMeText(),
          ],
        ),
      ),
    );
  }

  Widget buildImageGrid() {
    // List of image paths
    List<String> imagePaths = [
      'assets/images/2.jpg',
      'assets/images/1.jpg',
      'assets/images/3.jpeg',
      'assets/images/4.jpeg',
      'assets/images/5.jpeg',
      'assets/images/6.jpeg',
    ];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(3, (rowIndex) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
                      borderRadius: BorderRadius.circular(
                          10), // Optional: Rounded corners
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget buildAboutMeText() {
    return const Center(
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

  Widget buildProjectsGrid() {
    return SizedBox(
      key: projectsKey, // Key for Projects Section
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: constraints.maxWidth /
                  (MediaQuery.of(context).orientation == Orientation.portrait
                      ? 1
                      : 1),
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
                        width: 80,
                        height: 80,
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

  Widget buildSkillsAndEducation() {
    return SizedBox(
      height: 950,
      child: Column(
        children: [
          Expanded(
            child: buildSkillsCard(),
          ),
          Expanded(
            child: buildEducationCard(),
          ),
        ],
      ),
    );
  }

  Widget buildSkillsCard() {
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
            buildSkillItem(Icons.flutter_dash, 'Flutter'),
            buildSkillItem(Icons.code, 'Dart'),
            buildSkillItem(Icons.design_services, 'UI/UX Design'),
            buildSkillItem(Icons.html_rounded, 'Html'),
            buildSkillItem(Icons.wordpress, 'Wordpress'),
          ],
        ),
      ),
    );
  }

  Widget buildSkillItem(IconData icon, String skill) {
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

  Widget buildEducationCard() {
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
            buildEducationItem(
                'BS (Hons) Computer Science \nUniversity of Management \nand Technology(UMT)'),
            const Gap(20),
            buildEducationItem(
                'Intermediate (ICS) \nThe knowledge Home School \nand College'),
            const Gap(20),
            buildEducationItem(
                'Matriculation\nThe Knowledge Home School\n and College'),
          ],
        ),
      ),
    );
  }

  Widget buildEducationItem(String education) {
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

  Widget buildContactUsSection() {
    return Container(
      key: contactKey, // Key for Contact Us Section
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: Card(
          color: Colors.white70,
          shadowColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                  opacity: 0.5,
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
                        'https://www.linkedin.com/in/\nbushra-aslam-19b356245/ ',
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
                        ' Dera Ismail Khan,\n Pakistan',
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
