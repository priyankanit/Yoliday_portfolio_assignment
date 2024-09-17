import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_portfolio/model/project.dart';
import 'package:yoliday_portfolio/widgets/project_card.dart';


class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> with TickerProviderStateMixin {
  late TabController tabController;
  String searchQuery = '';
  int selectedIndex = 0;

  @override
  void initState() {
  tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Project> projects = [
  Project(
    title: 'Kemampuan Merangkum Tulisan', 
    author: 'BAHASAN SUNDA', 
    image: 'assets/images/work1.jpg',
    text: 'Oleh AI-Baiqi Samaan'),
     Project(
    title: 'Kemampuan Merangkum Tulisan', 
    author: 'BAHASAN SUNDA', 
    image: 'assets/images/work.jpg',
    text: 'Oleh AI-Baiqi Samaan'),
     Project(
    title: 'Kemampuan Merangkum Tulisan', 
    author: 'BAHASAN SUNDA', 
    image: 'assets/images/work4.jpg',
    text: 'Oleh AI-Baiqi Samaan'),
     Project(
    title: 'Kemampuan Merangkum Tulisan', 
    author: 'BAHASAN SUNDA', 
    image: 'assets/images/work5.jpg',
    text: 'Oleh AI-Baiqi Samaan'),
     Project(
    title: 'Kemampuan Merangkum Tulisan', 
    author: 'BAHASAN SUNDA', 
    image: 'assets/images/work3.jpg',
    text: 'Oleh AI-Baiqi Samaan'),
       Project(
    title: 'Kemampuan Merangkum Tulisan', 
    author: 'BAHASAN SUNDA', 
    image: 'assets/images/work6.jpg',
    text: 'Oleh AI-Baiqi Samaan'),
    
];

 // Filter projects based on search query
    final filteredProjects = projects.where((project) {
      return project.title.toLowerCase().contains(searchQuery.toLowerCase()); 
    }).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          title: Text("Portfolio", 
          style: TextStyle(
            color: const Color(0xff303030), 
            fontFamily: 'Roboto', 
            fontSize: 18.sp, 
            fontWeight: FontWeight.w500
            ),
            ),
          actions: [
            IconButton(onPressed: (){}, 
            icon: const Icon(Icons.shopping_bag), 
            color: const Color(0xffDF5532)
            ),
            IconButton(onPressed: (){}, 
            icon: const Icon(Icons.notifications), 
            color: const Color(0xffDF5532),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              color: Colors.white,
              child: TabBar(
                labelPadding: const EdgeInsets.only(right: 18).r,
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.all(8.0).r,
                indicatorPadding: EdgeInsets.zero,
                 controller: tabController,
                indicatorColor: const Color(0xffDF5532),
                unselectedLabelColor: const Color(0xff303030),
                labelColor: const Color(0xffDF5532),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: const Color(0xffDF5532),
                    width: 2.0.w,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                 tabs: const [
                 Tab(
                  text: 'Project',
                 ),
                 Tab(
                    text: 'Saved',
                  ),
                Tab(
                 text: 'Shared',
                 ),
                Tab(
                     text: 'Achievement',
                  ),
              ],
               ),
            ),
          ),
         ),
        body: Column(
                 children: [
                   Container(
                    height: 60.h,
                    color: const Color(0xffFFFFFF),
                    child: 
                        Padding(
                          padding: const EdgeInsets.all(8.0).h,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            cursorColor: const Color(0xffE0E0E0),
                            decoration: InputDecoration(
                              hintText: 'Search a project',
                              hintStyle: TextStyle(fontFamily: 'Roboto', 
                              fontSize: 14.sp, 
                              fontWeight: FontWeight.w400, 
                              color: Colors.grey
                              ),
                              suffixIcon: Container(
                                height: 30.h,
                                width: 30.w,
                                margin: const EdgeInsets.all(8).r,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffDF5532),),
                                child:  Icon(Icons.search, size: 18.sp),),
                              suffixIconColor: const Color(0xffE0E0E0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.0.w, color: const Color(0xffE0E0E0)),
                                borderRadius: BorderRadius.all(const Radius.circular(10.0).r
                                ), 
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.0.w, color: const Color(0xffE0E0E0)),
                                borderRadius: BorderRadius.all(const Radius.circular(10).r),
                              )
                            ),
                              
                            ),
                                  
                          ),
                   ),
                         Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              _buildProjectContent(filteredProjects),
                              _buildSavedContent(),
                              _buildSharedContent(),
                              _buildAchievementContent(),
                            ],
                            ),
                         ),
                        
                      ],
                         ),
                   );
  }
}
      
  Widget _buildProjectContent(List<Project> filteredProjects) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ProjectCard(projects: filteredProjects),
    );
  }

  Widget _buildSharedContent() {
    return const Center(child: Text('Shared Content'));
  }

  Widget _buildSavedContent() {
    return const Center(child: Text('Saved Content'));
  }

  Widget _buildAchievementContent() {
    return const Center(child: Text('Achievement Content'));
  }
     
  

