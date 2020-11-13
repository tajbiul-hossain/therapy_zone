import 'package:flutter/material.dart';
import 'package:Unwind/models/disorder.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigate_back.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:Unwind/pages/home/disorderInfo.dart';

class Learn extends StatefulWidget with NavigationStates {
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  Back back = Back();

  //LIST OF MOST COMMON DISORDERS
  List<Disorder> disorders = [
    Disorder(
        name: 'ADHD',
        description:
            'Attention-deficit/hyperactivity disorder (ADHD) is one of the most common mental disorders affecting children. ADHD also affects many adults. Symptoms of ADHD include inattention (not being able to keep focus), hyperactivity (excess movement that is not fitting to the setting) and impulsivity (hasty acts that occur in the moment without thought).\n\nAn estimated 8.4 percent of children and 2.5 percent of adults have ADHD.1,2 ADHD is often first identified in school-aged children when it leads to disruption in the classroom or problems with schoolwork. It can also affect adults. It is more common among boys than girls.',
        url:
            'https://www.webmd.com/add-adhd/childhood-adhd/attention-deficit-hyperactivity-disorder-adhd'),
    Disorder(
        name: 'OCD',
        description:
            'Obsessive-compulsive disorder (OCD) is a mental disorder in which people have unwanted and repeated thoughts, feelings, ideas, sensations (obsessions), and behaviors that drive them to do something over and over (compulsions).\n\nOften the person carries out the behaviors to get rid of the obsessive thoughts. But this only provides short-term relief. Not doing the obsessive rituals can cause great anxiety and distress.',
        url:
            'https://www.webmd.com/mental-health/obsessive-compulsive-disorder#1'),
    Disorder(
        name: 'Bipolar Disorder',
        description:
            'Bipolar disorder is a mental illness marked by extreme shifts in mood. Symptoms can include an extremely elevated mood called mania. They can also include episodes of depression. Bipolar disorder is also known as bipolar disease or manic depression.\n\nPeople with bipolar disorder may have trouble managing everyday life tasks at school or work, or maintaining relationships. There’s no cure, but there are many treatment options available that can help to manage the symptoms.',
        url: 'https://www.healthline.com/health/bipolar-disorder'),
    Disorder(
        name: 'Anxiety',
        description:
            'A racing mind that replays the same worries again and again, sleepless nights, a churning stomach or sweaty palms – anxiety can present itself in a lot of different ways. A little bit of worry or stress is a normal part of life. But if these feelings persist for a couple of weeks or more, or if they affect your ability to work, study or enjoy life, they might point to an anxiety disorder.',
        url: 'https://www.webmd.com/anxiety-panic/guide/anxiety-disorders#1'),
    Disorder(
        name: 'Depression',
        description:
            'Depression (major depressive disorder) is a common and serious medical illness that negatively affects how you feel, the way you think and how you act. Fortunately, it is also treatable. Depression causes feelings of sadness and/or a loss of interest in activities you once enjoyed. It can lead to a variety of emotional and physical problems and can decrease your ability to function at work and at home.',
        url:
            'https://www.psychiatry.org/patients-families/depression/what-is-depression'),
    Disorder(
        name: 'PTSD',
        description:
            'Post-traumatic stress disorder (PTSD) is a mental health condition that\'s triggered by a terrifying event — either experiencing it or witnessing it. Symptoms may include flashbacks, nightmares and severe anxiety, as well as uncontrollable thoughts about the event.\n\nMost people who go through traumatic events may have temporary difficulty adjusting and coping, but with time and good self-care, they usually get better. If the symptoms get worse, last for months or even years, and interfere with your day-to-day functioning, you may have PTSD.\n\nGetting effective treatment after PTSD symptoms develop can be critical to reduce symptoms and improve function.',
        url:
            'https://www.webmd.com/mental-health/post-traumatic-stress-disorder#1'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        back.moveToHomeScreen(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(51, 129, 239, 0.8),
          title: Center(
              child: Text(
            'LEARN',
            style: TextStyle(
                color: Color.fromRGBO(252, 195, 163, 1),
                letterSpacing: 2,
                fontSize: 22,
                fontWeight: FontWeight.w900),
          )),
        ),
        body: Container(
          color: Colors.lightBlueAccent.withOpacity(0.5),
          child: ListView.builder(
            itemCount: disorders.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color.fromRGBO(47, 94, 161, 1),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: ListTile(
                    onTap: null,
                    title: Column(
                      children: [
                        Text(
                          disorders[index].name,
                          style: TextStyle(
                              fontSize: 22, color: Colors.yellow[100]),
                        ),
                        Divider(
                          thickness: .7,
                          height: 30,
                          color: Colors.white,
                        ),
                        Container(
                          child: Text(
                            disorders[index].description,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DisorderInfo(
                                            name: disorders[index].name,
                                            url: disorders[index].url)));
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white30,
                              child: Text(
                                'Learn More',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    letterSpacing: 1),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
