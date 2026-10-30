import 'package:flutter/material.dart';

void main() => runApp(const GymPulseApp());

const lime = Color(0xFFB9F36B);
const bg = Color(0xFF0B1018);
const panel = Color(0xFF151E2A);

class GymPulseApp extends StatelessWidget {
  const GymPulseApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'GYM PULSE', debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: lime, brightness: Brightness.dark),
      cardColor: panel, appBarTheme: const AppBarTheme(backgroundColor: bg, elevation: 0),
      inputDecorationTheme: InputDecorationTheme(
        filled: true, fillColor: const Color(0xFF101925),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    home: const MainShell(),
  );
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int role = 0, checkins = 18;
  bool checkedIn = false, marketing = false, service = true;
  int threshold = 10;
  final phone = TextEditingController(text: '9876543210');
  final reason = TextEditingController();
  final List<Map<String,String>> risks = [
    {'name':'Amit Patel','phone':'9876500011','plan':'Quarterly','last':'12 Oct','days':'19','trainer':'Rohit'},
    {'name':'Priya Singh','phone':'9876500012','plan':'Monthly','last':'20 Oct','days':'11','trainer':'Neha'},
    {'name':'Saurabh Gupta','phone':'9876500013','plan':'Yearly','last':'15 Oct','days':'16','trainer':'Rohit'},
    {'name':'Neha Yadav','phone':'9876500014','plan':'Quarterly','last':'18 Oct','days':'13','trainer':'Neha'},
    {'name':'Vikas Tiwari','phone':'9876500015','plan':'Monthly','last':'17 Oct','days':'14','trainer':'Arjun'},
    {'name':'Pooja Sharma','phone':'9876500016','plan':'Half-yearly','last':'11 Oct','days':'20','trainer':'Arjun'},
  ];
  void toast(String s) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  void dialog(String title, Widget child) => showDialog(context: context, builder: (_) => AlertDialog(
    title: Text(title), content: child, actions: [TextButton(onPressed:()=>Navigator.pop(context), child: const Text('CLOSE'))],
  ));
  Widget metric(String label, String value, {String? note, Color? color}) => Card(
    color: panel, child: Padding(padding: const EdgeInsets.all(14), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label.toUpperCase(), style: const TextStyle(color: Colors.white60,fontSize:11)),
        const SizedBox(height:8), Text(value, style: TextStyle(fontSize:25,fontWeight:FontWeight.w900,color:color ?? Colors.white)),
        if(note!=null) Text(note,style:const TextStyle(color:Colors.white54,fontSize:11)),
      ],
    )),
  );
  Widget section(String title, Widget child) => Padding(padding: const EdgeInsets.only(top:18), child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,style:const TextStyle(fontSize:17,fontWeight:FontWeight.w800)),
      const SizedBox(height:9), child,
    ],
  ));
  Widget action(String label, VoidCallback onTap, {bool primary=false, IconData? icon}) => SizedBox(
    width: double.infinity, child: primary ? FilledButton.icon(
      style: FilledButton.styleFrom(backgroundColor:lime,foregroundColor:bg,padding:const EdgeInsets.symmetric(vertical:14)),
      onPressed:onTap, icon:Icon(icon??Icons.arrow_forward), label:Text(label,style:const TextStyle(fontWeight:FontWeight.bold)),
    ) : OutlinedButton.icon(onPressed:onTap,icon:Icon(icon??Icons.chevron_right),label:Text(label)),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Row(children:[CircleAvatar(backgroundColor:lime,child:Text('GP',style:TextStyle(color:bg,fontWeight:FontWeight.w900))),SizedBox(width:10),Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('GYM PULSE',style:TextStyle(fontWeight:FontWeight.w900,letterSpacing:1)),Text('STRONGER MEMBERSHIPS',style:TextStyle(fontSize:9,color:Colors.white54))])]),
      actions:[Padding(padding:const EdgeInsets.only(right:12),child:Center(child:Container(padding:const EdgeInsets.symmetric(horizontal:9,vertical:5),decoration:BoxDecoration(color:Colors.green.withOpacity(.18),borderRadius:BorderRadius.circular(20)),child:const Text('DEMO',style:TextStyle(color:lime,fontSize:11,fontWeight:FontWeight.bold)))))],
    ),
    body: SafeArea(child: Column(children:[
      Padding(padding:const EdgeInsets.fromLTRB(14,4,14,8),child: SegmentedButton<int>(
        segments: const [
          ButtonSegment(value:0,label:Text('Member'),icon:Icon(Icons.person)),
          ButtonSegment(value:1,label:Text('Owner'),icon:Icon(Icons.dashboard)),
          ButtonSegment(value:2,label:Text('Front Desk'),icon:Icon(Icons.point_of_sale)),
        ], selected:{role}, onSelectionChanged:(v)=>setState(()=>role=v),
      )),
      Expanded(child: ListView(padding:const EdgeInsets.fromLTRB(16,8,16,28),children:[
        if(role==0) memberView(),
        if(role==1) ownerView(),
        if(role==2) deskView(),
        const SizedBox(height:20),
        const Text('DEMO ONLY · No real QR validation, payments, messages or cloud database are connected.',style:TextStyle(color:Colors.white38,fontSize:11)),
      ])),
    ])),
  );

  Widget memberView() => Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    const Text('GOOD MORNING',style:TextStyle(color:Colors.white54,fontSize:11)),
    const Text('Rahul Verma 👋',style:TextStyle(fontSize:24,fontWeight:FontWeight.w900)),
    const Text('Member ID · GP0021',style:TextStyle(color:Colors.white54)),
    section('Your membership',Card(color:const Color(0xFF20372E),child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      const Text('QUARTERLY PLAN',style:TextStyle(fontSize:21,fontWeight:FontWeight.w900)),
      const Text('Valid until 07 Nov 2026 · 7 days left',style:TextStyle(color:Colors.white70)),
      const SizedBox(height:16),const Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text('Weekly goal'),Text('4 / 5 visits')]),
      const SizedBox(height:7),const LinearProgressIndicator(value:.8,minHeight:7,backgroundColor:Colors.black26,color:lime),
      const SizedBox(height:14),action('Renew membership',renew,primary:true),
    ])))),
    GridView.count(shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),crossAxisCount:2,childAspectRatio:1.7,children:[
      metric('This week','4 / 5',note:'Weekly attendance'),
      metric('Current streak','3 🔥',note:'Planned visit streak'),
    ]),
    section('QR check-in',Card(color:panel,child:Padding(padding:const EdgeInsets.all(14),child:Column(children:[
      const Text('Scan the gym session QR code to record attendance.'),
      const SizedBox(height:12),action(checkedIn?'Already checked in':'Simulate QR check-in',()=>setState((){if(checkedIn){toast('Duplicate scan: already checked in.');}else{checkedIn=true;checkins++;toast('Check-in successful in demo.');}}),primary:true,icon:Icons.qr_code_scanner),
      const SizedBox(height:7),action('Test invalid QR',()=>toast('Invalid or expired QR. No attendance recorded.')),
      action('Test offline queue',()=>toast('Offline: queued locally, not yet confirmed by server.')),
    ])))),
    section('Attendance history',Card(color:panel,child:const Column(children:[
      ListTile(title:Text('30 Oct 2026'),subtitle:Text('07:12 AM · Morning'),trailing:Text('Checked in',style:TextStyle(color:lime))),
      Divider(height:1),ListTile(title:Text('29 Oct 2026'),subtitle:Text('06:55 AM · Morning'),trailing:Text('Checked in',style:TextStyle(color:lime))),
      Divider(height:1),ListTile(title:Text('27 Oct 2026'),subtitle:Text('07:20 AM · Morning'),trailing:Text('Checked in',style:TextStyle(color:lime))),
    ]))),
    section('Add-on marketplace',Column(children:[
      addonTile('Personal Training · 8 sessions','₹2,400','Qualified trainer · 30 days'),
      addonTile('Diet Plan · 30 days','₹999','Coach-reviewed plan'),
      addonTile('Whey Protein · 1 kg','₹2,199','Stock: 8 · sealed pack'),
    ])),
    section('Communication preferences',Card(color:panel,child:Column(children:[
      SwitchListTile(value:service,onChanged:(v)=>setState(()=>service=v),title:const Text('Service reminders')),
      SwitchListTile(value:marketing,onChanged:(v)=>setState(()=>marketing=v),title:const Text('Optional marketing offers')),
      const Padding(padding:EdgeInsets.all(12),child:Text('Marketing consent is separate. Opt-out is supported.',style:TextStyle(color:Colors.white54,fontSize:12))),
    ]))),
  ]);

  Widget addonTile(String name,String price,String detail)=>Card(color:panel,child:ListTile(
    title:Text(name,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(detail),
    trailing:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(price,style:const TextStyle(color:lime,fontWeight:FontWeight.bold)),TextButton(onPressed:()=>addonOrder(name,price),child:const Text('VIEW'))]),
  ));

  void renew(){
    String selected='Quarterly · 3 months';
    showDialog(context:context,builder:(ctx)=>StatefulBuilder(builder:(ctx,setD)=>AlertDialog(
      title:const Text('Renew membership'),
      content:Column(mainAxisSize:MainAxisSize.min,children:[
        const Text('Reminder: 7 days before expiry · 07 Nov 2026'),
        const SizedBox(height:12),
        for(final p in ['Monthly · ₹1,200','Quarterly · ₹3,000 (demo discount)','Half-yearly · ₹5,500','Yearly · ₹10,000'])
          RadioListTile<String>(dense:true,value:p,groupValue:selected,title:Text(p),onChanged:(v)=>setD(()=>selected=v!)),
        const Text('Membership extends only after verified payment.',style:TextStyle(color:Colors.white54,fontSize:11)),
      ]),
      actions:[TextButton(onPressed:()=>Navigator.pop(ctx),child:const Text('CANCEL')),FilledButton(onPressed:(){Navigator.pop(ctx);paymentDemo();},child:const Text('CONTINUE'))],
    )));
  }
  void paymentDemo()=>dialog('Simulated payment',Column(mainAxisSize:MainAxisSize.min,children:[
    const Text('Payment created · Pending verification'),
    const SizedBox(height:12),
    const Text('No real money is charged.'),
    const SizedBox(height:12),
    action('Simulate verified success',()=>{Navigator.pop(context),toast('Demo payment verified. Receipt issued; membership extension simulated.')},primary:true),
    action('Simulate failed payment',()=>{Navigator.pop(context),toast('Payment failed. Membership unchanged.')}),
  ]));
  void addonOrder(String name,String price)=>dialog('Review add-on',Column(mainAxisSize:MainAxisSize.min,children:[
    Text(name,style:const TextStyle(fontWeight:FontWeight.bold)),Text(price,style:const TextStyle(color:lime)),
    const SizedBox(height:10),const Text('Not pre-selected. Check availability and cancellation terms before ordering.',style:TextStyle(fontSize:12,color:Colors.white60)),
    action('Create demo order',()=>{Navigator.pop(context),toast('Demo order created. No payment charged.')},primary:true),
  ]));

  Widget ownerView()=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    const Text('OWNER OVERVIEW · 31 OCT 2026',style:TextStyle(color:Colors.white54,fontSize:11)),
    const Text('Good morning, Admin',style:TextStyle(fontSize:23,fontWeight:FontWeight.w900)),
    const Text('Shakti Fitness Club · Anuppur, MP',style:TextStyle(color:Colors.white54)),
    GridView.count(shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),crossAxisCount:2,childAspectRatio:1.65,children:[
      metric('Active members','30',note:'+2 this month'),
      metric("Today's check-ins",'$checkins',note:'Demo live count'),
      metric('7-day active','24',note:'Unique members'),
      metric('Open no-show cases','6',note:'10-day threshold',color:Colors.redAccent),
      metric('Returned members','3',note:'This month',color:lime),
      metric('Renewals due','5',note:'Next 7 days',color:Colors.orangeAccent),
      metric('Renewal collection','₹18,500',note:'This month'),
      metric('Add-on revenue','₹12,400',note:'This month'),
    ]),
    section('At-risk members · Red list',Card(color:panel,child:Column(children:risks.map((r)=>ExpansionTile(
      title:Text(r['name']!,style:const TextStyle(fontWeight:FontWeight.bold)),
      subtitle:Text('${r['days']} days absent · ${r['plan']} · Last visit ${r['last']}'),
      children:[Padding(padding:const EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text('Phone ${r['phone']} · Trainer ${r['trainer']}'),
        const SizedBox(height:8),
        Wrap(spacing:6,children:[
          OutlinedButton(onPressed:()=>toast('Call action logged in demo.'),child:const Text('Call')),
          OutlinedButton(onPressed:()=>toast('WhatsApp draft prepared; not sent.'),child:const Text('WhatsApp')),
          FilledButton(onPressed:()=>followup(r['name']!),child:const Text('Mark outcome')),
        ]),
      ]))],
    )).toList()))),
    section('Renewal pipeline',Card(color:panel,child:const Column(children:[
      ListTile(title:Text('5 members expiring within 7 days'),trailing:Text('₹15,000',style:TextStyle(color:lime))),
      ListTile(title:Text('3 payments pending verification'),trailing:Text('Review',style:TextStyle(color:Colors.orangeAccent))),
      ListTile(title:Text('2 verified paid orders'),trailing:Text('Verified',style:TextStyle(color:lime))),
    ]))),
    section('No-show settings',Card(color:panel,child:Padding(padding:const EdgeInsets.all(12),child:Column(children:[
      Text('Threshold: $threshold days'),
      Slider(value:threshold.toDouble(),min:3,max:30,divisions:27,label:'$threshold days',onChanged:(v)=>setState(()=>threshold=v.round())),
      action('Save threshold',()=>toast('Threshold saved in demo: $threshold days'),primary:true),
    ])))),
    section('Daily owner summary',Card(color:panel,child:Padding(padding:const EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      const Text('18 check-ins · 1 new risk case · 4 follow-ups · 2 renewals · 3 add-on actions'),
      const SizedBox(height:10),action('Generate daily summary',()=>dialog('Daily summary',const Text('Shakti Fitness Club · 31 Oct 2026\\n18 check-ins\\n1 new risk case\\n4 follow-ups\\n2 renewals\\n3 add-on actions.')),primary:true),
    ])))),
  ]);

  void followup(String member){
    String outcome='Will return'; final date=TextEditingController();
    showDialog(context:context,builder:(ctx)=>StatefulBuilder(builder:(ctx,setD)=>AlertDialog(
      title:Text('Follow-up · $member'),
      content:Column(mainAxisSize:MainAxisSize.min,children:[
        DropdownButtonFormField<String>(value:outcome,items:['Will return','Injured','Travelling','Timing issue','Unhappy','No response','Cancelled'].map((s)=>DropdownMenuItem(value:s,child:Text(s))).toList(),onChanged:(v)=>setD(()=>outcome=v!)),
        const SizedBox(height:10),TextField(controller:date,decoration:const InputDecoration(labelText:'Next action date (YYYY-MM-DD)')),
        const Text('Next action date is required for unresolved cases.',style:TextStyle(fontSize:11,color:Colors.white54)),
      ]),
      actions:[TextButton(onPressed:()=>Navigator.pop(ctx),child:const Text('CANCEL')),FilledButton(onPressed:(){if(outcome!='Cancelled'&&date.text.trim().isEmpty){toast('Please enter next action date.');return;}Navigator.pop(ctx);toast('Outcome saved: $outcome');},child:const Text('SAVE'))],
    )));
  }

  Widget deskView()=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    const Text('FRONT DESK',style:TextStyle(color:Colors.white54,fontSize:11)),
    const Text('Member lookup',style:TextStyle(fontSize:23,fontWeight:FontWeight.w900)),
    Card(color:panel,child:Padding(padding:const EdgeInsets.all(14),child:Column(children:[
      TextField(controller:phone,keyboardType:TextInputType.phone,maxLength:10,decoration:const InputDecoration(labelText:'Registered mobile number')),
      action('Find member',()=>setState(()=>{}),primary:true),
      if(phone.text=='9876543210')const ListTile(title:Text('Rahul Verma · Active'),subtitle:Text('Quarterly plan · Expires 07 Nov 2026'),leading:Icon(Icons.verified,color:lime)),
      if(phone.text!='9876543210')const Text('Demo lookup supports 9876543210 only. Connect the database for real lookup.',style:TextStyle(color:Colors.white54,fontSize:12)),
    ]))),
    section('Assisted check-in',Card(color:panel,child:Padding(padding:const EdgeInsets.all(14),child:Column(children:[
      TextField(controller:reason,decoration:const InputDecoration(labelText:'Mandatory reason',hintText:'QR scanner issue / phone unavailable')),
      const SizedBox(height:10),action('Record assisted check-in',()=>{if(reason.text.trim().isEmpty){toast('Reason is mandatory.');}else{toast('Assisted check-in recorded with audit log (demo).');reason.clear();}},primary:true),
    ])))),
    section('Payment verification',Card(color:panel,child:ListTile(title:const Text('Order #RN-104 · ₹3,000'),subtitle:const Text('Pending verification'),trailing:TextButton(onPressed:()=>toast('Demo only: production must verify provider signature.'),child:const Text('VERIFY'))))),
  ]);
}
