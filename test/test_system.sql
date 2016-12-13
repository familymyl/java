/*
MySQL Data Transfer
Source Host: localhost
Source Database: test_system
Target Host: localhost
Target Database: test_system
Date: 2016/12/12 11:56:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for choice_answer
-- ----------------------------
CREATE TABLE `choice_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for choice_option
-- ----------------------------
CREATE TABLE `choice_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `optionId` tinyint(4) DEFAULT NULL,
  `options` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for program_answer
-- ----------------------------
CREATE TABLE `program_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `answer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question
-- ----------------------------
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `difficulty` tinyint(4) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `choice` tinyint(4) DEFAULT NULL,
  `program` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question_tag
-- ----------------------------
CREATE TABLE `question_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for racer
-- ----------------------------
CREATE TABLE `racer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `information` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for racer_question
-- ----------------------------
CREATE TABLE `racer_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `racer_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `race` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pinyin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `category` VALUES ('1', '变量、运算符、表达式', '10', '1000');
INSERT INTO `category` VALUES ('2', '判断、分支', '20', '1000');
INSERT INTO `category` VALUES ('3', '循环、多重循环', '30', '1000');
INSERT INTO `category` VALUES ('4', '静态方法', '40', '1000');
INSERT INTO `category` VALUES ('5', '数组及常用操作', '50', '1000');
INSERT INTO `category` VALUES ('6', '数组排序', '60', '1000');
INSERT INTO `category` VALUES ('7', '二维数组', '70', '1000');
INSERT INTO `category` VALUES ('8', '面向对象', '80', '1000');
INSERT INTO `category` VALUES ('9', '封装、继承、多态', '90', '1000');
INSERT INTO `category` VALUES ('10', '抽象类', '100', '1000');
INSERT INTO `category` VALUES ('11', '接口', '110', '1000');
INSERT INTO `category` VALUES ('12', '内部类', '120', '1000');
INSERT INTO `category` VALUES ('13', 'Object类', '130', '1000');
INSERT INTO `category` VALUES ('14', '包装类', '140', '1000');
INSERT INTO `category` VALUES ('15', 'String类', '150', '1000');
INSERT INTO `category` VALUES ('16', '常见类', '160', '1000');
INSERT INTO `category` VALUES ('17', '集合框架', '170', '1000');
INSERT INTO `category` VALUES ('18', 'List', '180', '1000');
INSERT INTO `category` VALUES ('19', 'Set', '190', '1000');
INSERT INTO `category` VALUES ('20', 'Map', '200', '1000');
INSERT INTO `category` VALUES ('21', '集合泛型', '210', '1000');
INSERT INTO `category` VALUES ('22', '异常', '220', '1000');
INSERT INTO `category` VALUES ('23', '多线程', '230', '1000');
INSERT INTO `category` VALUES ('24', 'I/O 流', '240', '1000');
INSERT INTO `category` VALUES ('25', '反射', '250', '1000');
INSERT INTO `category` VALUES ('999', '益智抢答', '4', null);
INSERT INTO `category` VALUES ('1000', '第一阶段', '1', null);
INSERT INTO `category` VALUES ('2000', '第二阶段', '2', null);
INSERT INTO `category` VALUES ('3000', '第三阶段', '3', null);
INSERT INTO `choice_answer` VALUES ('1', '1', 'C');
INSERT INTO `choice_answer` VALUES ('2', '2', 'B');
INSERT INTO `choice_answer` VALUES ('3', '3', 'D');
INSERT INTO `choice_answer` VALUES ('4', '4', 'A');
INSERT INTO `choice_answer` VALUES ('5', '5', 'C');
INSERT INTO `choice_answer` VALUES ('6', '6', 'B');
INSERT INTO `choice_answer` VALUES ('7', '7', 'C');
INSERT INTO `choice_answer` VALUES ('8', '8', 'D');
INSERT INTO `choice_answer` VALUES ('9', '9', 'A');
INSERT INTO `choice_answer` VALUES ('10', '10', 'C');
INSERT INTO `choice_answer` VALUES ('11', '11', 'D');
INSERT INTO `choice_answer` VALUES ('12', '12', 'A');
INSERT INTO `choice_answer` VALUES ('13', '13', 'D');
INSERT INTO `choice_answer` VALUES ('14', '14', 'B');
INSERT INTO `choice_answer` VALUES ('15', '15', 'D');
INSERT INTO `choice_answer` VALUES ('16', '16', 'D');
INSERT INTO `choice_answer` VALUES ('17', '17', 'D');
INSERT INTO `choice_answer` VALUES ('18', '18', 'A');
INSERT INTO `choice_answer` VALUES ('19', '19', 'C');
INSERT INTO `choice_answer` VALUES ('20', '20', 'D');
INSERT INTO `choice_option` VALUES ('1', '1', '1', 'A、BigMeaninglessName 	');
INSERT INTO `choice_option` VALUES ('2', '1', '2', 'B、$int	 ');
INSERT INTO `choice_option` VALUES ('3', '1', '3', 'C、default 	');
INSERT INTO `choice_option` VALUES ('4', '1', '4', 'D、$1');
INSERT INTO `choice_option` VALUES ('9', '3', '1', 'A.hello world 4 hello world 2 ');
INSERT INTO `choice_option` VALUES ('10', '3', '2', 'B.hello world 2 hello world 4');
INSERT INTO `choice_option` VALUES ('11', '3', '3', 'C.hello world 2 hello world 4 hello world 1');
INSERT INTO `choice_option` VALUES ('12', '3', '4', 'D.hello world 4 hello world 1 ');
INSERT INTO `choice_option` VALUES ('13', '2', '1', 'A、6      ');
INSERT INTO `choice_option` VALUES ('14', '2', '2', 'B、7     ');
INSERT INTO `choice_option` VALUES ('15', '2', '3', 'C、8  	');
INSERT INTO `choice_option` VALUES ('16', '2', '4', 'D、编译时有错，无结果');
INSERT INTO `choice_option` VALUES ('17', '4', '1', 'A、float f = 1.1; ');
INSERT INTO `choice_option` VALUES ('18', '4', '2', 'B、byte b = 12; ');
INSERT INTO `choice_option` VALUES ('19', '4', '3', 'C、double d = 1.5;');
INSERT INTO `choice_option` VALUES ('20', '4', '4', 'D、int a = 4;');
INSERT INTO `choice_option` VALUES ('21', '5', '1', 'A、9		');
INSERT INTO `choice_option` VALUES ('22', '5', '2', 'B、10		');
INSERT INTO `choice_option` VALUES ('23', '5', '3', 'C、11		');
INSERT INTO `choice_option` VALUES ('24', '5', '4', 'D、12');
INSERT INTO `choice_option` VALUES ('25', '6', '1', 'A、\"12aa3\"');
INSERT INTO `choice_option` VALUES ('26', '6', '2', 'B、\"3aa3 \"');
INSERT INTO `choice_option` VALUES ('27', '6', '3', 'C、\"12aa\"');
INSERT INTO `choice_option` VALUES ('28', '6', '4', 'D、\"aa3\" ');
INSERT INTO `choice_option` VALUES ('29', '7', '1', 'A、char str[] ');
INSERT INTO `choice_option` VALUES ('30', '7', '2', 'B、char str[][]');
INSERT INTO `choice_option` VALUES ('31', '7', '3', 'C、String str[]=new String[10]');
INSERT INTO `choice_option` VALUES ('32', '7', '4', 'D、String str[10]');
INSERT INTO `choice_option` VALUES ('33', '8', '1', 'A、a(3)		');
INSERT INTO `choice_option` VALUES ('34', '8', '2', 'B、a[3]			');
INSERT INTO `choice_option` VALUES ('35', '8', '3', 'C、a(2)			');
INSERT INTO `choice_option` VALUES ('36', '8', '4', 'D、a[2]');
INSERT INTO `choice_option` VALUES ('37', '9', '1', 'A、arraycopy(a,0,b,0,a.length) ');
INSERT INTO `choice_option` VALUES ('38', '9', '2', 'B、arraycopy(a,0,b,0,b.length) ');
INSERT INTO `choice_option` VALUES ('39', '9', '3', 'C、arraycopy(b,0,a,0,a.length)');
INSERT INTO `choice_option` VALUES ('40', '9', '4', 'D、arraycopy(a,1,b,1,a.length)');
INSERT INTO `choice_option` VALUES ('41', '10', '1', 'A、60				');
INSERT INTO `choice_option` VALUES ('42', '10', '2', 'B、20				');
INSERT INTO `choice_option` VALUES ('43', '10', '3', 'C、30				');
INSERT INTO `choice_option` VALUES ('44', '10', '4', 'D、50');
INSERT INTO `choice_option` VALUES ('45', '11', '1', 'A、String[] a = new String[]{\"1\",\"2\",\"3\"};\r\n');
INSERT INTO `choice_option` VALUES ('46', '11', '2', 'B、String[] a = {\"1\",\"2\",\"3\"};\r\n;');
INSERT INTO `choice_option` VALUES ('47', '11', '3', 'C、String[] a = new String[10];\r\n');
INSERT INTO `choice_option` VALUES ('48', '11', '4', 'D、String[] a;\r\na = {\"1\",\"2\",\"3\"}');
INSERT INTO `choice_option` VALUES ('49', '12', '1', 'A、array1[0]:6 array1[1]:7\r\n');
INSERT INTO `choice_option` VALUES ('50', '12', '2', 'B、array1[0]:7 array1[1]:6\r\n');
INSERT INTO `choice_option` VALUES ('51', '12', '3', 'C、array1[0]:3 array1[1]:4\r\n');
INSERT INTO `choice_option` VALUES ('52', '12', '4', 'D、array1[0]:4 array1[1]:3');
INSERT INTO `choice_option` VALUES ('53', '13', '1', 'A、A a = new C();\r\n');
INSERT INTO `choice_option` VALUES ('54', '13', '2', 'B、B b = new C();');
INSERT INTO `choice_option` VALUES ('55', '13', '3', 'C、C c = new C();\r\n');
INSERT INTO `choice_option` VALUES ('56', '13', '4', 'D、B b = new A();');
INSERT INTO `choice_option` VALUES ('57', '14', '1', 'A、一个类可以继承多个父类   	');
INSERT INTO `choice_option` VALUES ('58', '14', '2', 'B、一个类可以具有多个子类 \r\n');
INSERT INTO `choice_option` VALUES ('59', '14', '3', 'C、子类可以使用父类的所有方法  	');
INSERT INTO `choice_option` VALUES ('60', '14', '4', 'D、子类一定比父类有更多的成员方法');
INSERT INTO `choice_option` VALUES ('61', '15', '1', 'A、5行不能通过编译，因为引用了私有静态变量 ');
INSERT INTO `choice_option` VALUES ('62', '15', '2', 'B、10行不能通过编译，因为x是私有静态变量 ');
INSERT INTO `choice_option` VALUES ('63', '15', '3', 'C、程序通过编译，输出结果为：x=103 ');
INSERT INTO `choice_option` VALUES ('64', '15', '4', 'D、程序通过编译，输出结果为：x=102 ');
INSERT INTO `choice_option` VALUES ('65', '16', '1', 'A、getClass()				');
INSERT INTO `choice_option` VALUES ('66', '16', '2', 'B、finalize（）\r\n');
INSERT INTO `choice_option` VALUES ('67', '16', '3', 'C、toString（）			');
INSERT INTO `choice_option` VALUES ('68', '16', '4', 'D、hasNext（）');
INSERT INTO `choice_option` VALUES ('69', '17', '1', 'A、6	1					');
INSERT INTO `choice_option` VALUES ('70', '17', '2', 'B、6	-1\r\n');
INSERT INTO `choice_option` VALUES ('71', '17', '3', 'C、5	1					');
INSERT INTO `choice_option` VALUES ('72', '17', '4', 'D、5	-1');
INSERT INTO `choice_option` VALUES ('73', '18', '1', 'A、InterClass Create\r\nOuterClass Create');
INSERT INTO `choice_option` VALUES ('74', '18', '2', 'B、OuterClass Create\r\nInterClass Create	');
INSERT INTO `choice_option` VALUES ('75', '18', '3', 'C、OuterClass Create');
INSERT INTO `choice_option` VALUES ('76', '18', '4', 'D、InterClass Create	');
INSERT INTO `choice_option` VALUES ('77', '19', '1', 'A、ArrayList和LinkedList均实现了List接口');
INSERT INTO `choice_option` VALUES ('78', '19', '2', 'B、ArrayList的访问速度比LinkedList快');
INSERT INTO `choice_option` VALUES ('79', '19', '3', 'C、添加和删除元素时，ArrayList的表现更佳');
INSERT INTO `choice_option` VALUES ('80', '19', '4', 'D、HashMap实现Map接口，它允许任何类型的键和值对象，并允许将null用作键或值');
INSERT INTO `choice_option` VALUES ('81', '20', '1', 'A、Exception \r\nfinally \r\n商是：0');
INSERT INTO `choice_option` VALUES ('82', '20', '2', 'B、ArithmeticException \r\nfinally \r\n商是：0');
INSERT INTO `choice_option` VALUES ('83', '20', '3', 'C、 finally\r\n商是：0');
INSERT INTO `choice_option` VALUES ('84', '20', '4', 'D、编译报错');
INSERT INTO `question` VALUES ('1', '<p class=\"MsoNormal\">\r\n	以下标识符中哪项是不合法的（）\r\n</p>', '1', '1', '1', '0');
INSERT INTO `question` VALUES ('2', '<p class=\"MsoNormal\">\r\n	以下程序执行后输出结果是（）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-java\">int b = 6, c = 7, d = 8;\r\nif (b &lt; c){ if (b &gt; d)\r\n		System.out.println(d);\r\n	else\r\n		System.out.println(c);\r\n}</pre>\r\n<p>\r\n	<br />\r\n</p>', '1', '2', '1', '0');
INSERT INTO `question` VALUES ('3', '<p class=\"MsoNormal\">\r\n	以下程序运行结果（）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n<pre class=\"prettyprint lang-java\">int a=10;\r\nswitch(a){ \r\n   default:\r\n        System.out.print(\"hello world 4\");\r\n   case 1:\r\n        System.out.print(\"hello world 1\")；\r\n        break;\r\n   case 2:\r\n        System.out.print(\"hello world 2\")；\r\n        break;\r\n }</pre>\r\n</p>', '1', '2', '1', '0');
INSERT INTO `question` VALUES ('4', '<p class=\"MsoNormal\">\r\n	下列声明变量不正确的一个是（）\r\n</p>', '1', '1', '1', '0');
INSERT INTO `question` VALUES ('5', '<p class=\"MsoNormal\">\r\n	求如下程序输出结果（）\r\n</p>\r\n<pre class=\"prettyprint lang-java\">int a=10,b=20;\r\nif((a++&gt;b++)&amp;&amp;(a--&lt;b--)){\r\n	System.out.println(a);\r\n}else{\r\n	System.out.println(a);\r\n}</pre>', '1', '1', '1', '0');
INSERT INTO `question` VALUES ('6', '<p class=\"MsoNormal\">\r\n	<span>下列表达式</span>1+2+ \"aa\"+3的值是（）\r\n</p>', '1', '1', '1', '0');
INSERT INTO `question` VALUES ('7', '<p class=\"MsoNormal\">\r\n	<span>下面哪些表达式是声明一个含有</span>10个String对象的数组？\r\n</p>', '1', '5', '1', '0');
INSERT INTO `question` VALUES ('8', '<p class=\"MsoNormal\">\r\n	<span>数组</span>a的第三个元素表示为（）\r\n</p>', '1', '5', '1', '0');
INSERT INTO `question` VALUES ('9', '<pre class=\"prettyprint lang-java\">int[] a = {1,2,3};\r\nint[] b = new int[4];\r\n使用System.arraycopy()方法将数组a的全部元素复制到b正确的是？</pre>', '1', '5', '1', '0');
INSERT INTO `question` VALUES ('10', '<p class=\"MsoNormal\">\r\n	下面程序的运行结果是\r\n</p>\r\n<p class=\"MsoNormal\">\r\n<pre class=\"prettyprint lang-rb\">public static void main(String[] args){  \r\n    int x=30;  \r\n    int[] numbers=new int[x]; \r\n    x=60;  \r\n    System.out.println(numbers.length); \r\n} </pre>\r\n</p>', '1', '5', '1', '0');
INSERT INTO `question` VALUES ('11', '<p class=\"MsoNormal\">\r\n	下列初始化数组的代码中，不正确的是？\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>', '1', '5', '1', '0');
INSERT INTO `question` VALUES ('12', '<p class=\"MsoNormal\">\r\n	下列代码输出的结果为\r\n</p>\r\n<p class=\"MsoNormal\">\r\n<pre class=\"prettyprint lang-java\">public static void main(String[] args) {		\r\n    int[] array1 = {6, 7};\r\n    swapArray(array1);\r\n    System.out.println(\"array1[0]:\" + \r\n    array1[0] + \" array1[1]:\" + array1[1]);\r\n}\r\n\r\nstatic void swapArray(int[] array) {\r\n&nbsp;&nbsp;&nbsp;&nbsp;array = new int []{3,4};\r\n&nbsp;&nbsp;&nbsp;&nbsp;int t = array[0];\r\n&nbsp;&nbsp;&nbsp;&nbsp;array[0] = array[1];\r\n&nbsp;&nbsp;&nbsp;&nbsp;array[1] = t;\r\n&nbsp;&nbsp;&nbsp;&nbsp;// 将数组的[0]和[1]的元素互换\r\n}</pre>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>', '2', '5', '1', '0');
INSERT INTO `question` VALUES ('13', '<p class=\"MsoNormal\">\r\n	<span>已知类</span>A,B,C，当创建对象时以下程序哪行代码编译会出错？\r\n<pre class=\"prettyprint lang-java\">class A{}\r\nclass B extends A{}\r\nclass C extends B{}</pre>\r\n</p>', '1', '8', '1', '0');
INSERT INTO `question` VALUES ('14', '<p class=\"MsoNormal\">\r\n	在Java语言中，下列关于类的继承的描述，正确的是？\r\n</p>\r\n<p class=\"MsoNormal\">\r\n</p>', '1', '9', '1', '0');
INSERT INTO `question` VALUES ('15', '<p class=\"MsoNormal\">\r\n	关于以下程序代码的说明正确的是（）\r\n</p>\r\n<p class=\"MsoNormal\">\r\n<pre class=\"prettyprint lang-java\">1 public class HasStatic {\r\n2 	private static int x = 100;\r\n3 	public static void main(String args[]) {\r\n4 		HasStatic hs1 = new HasStatic();\r\n5 		hs1.x++;\r\n6 		HasStatic hs2 = new HasStatic();\r\n7		hs2.x++;\r\n8 		hs1 = new HasStatic();\r\n9 		hs1.x++;\r\n10		HasStatic.x--;\r\n11		System.out.println(\"x=\" + x);\r\n12	}\r\n13 }</pre>\r\n</p>', '2', '9', '1', '0');
INSERT INTO `question` VALUES ('16', '<p class=\"MsoNormal\">\r\n	<span>以下（）不是</span>Object类的方法？\r\n</p>', '1', '13', '1', '0');
INSERT INTO `question` VALUES ('17', '<p class=\"MsoNormal\">\r\n	下列代码的运行结果为\r\n</p>\r\n<p class=\"MsoNormal\">\r\n<pre class=\"prettyprint lang-java\">public static void main(String[] args) {\r\n    	String str = \"helloworld\";\r\n  	int a = str.indexOf(\"world\");\r\n        int b = str.indexOf(\"flower\");\r\n  	System.out.println(a+\"\\t\"+b);\r\n}</pre>\r\n</p>', '1', '15', '1', '0');
INSERT INTO `question` VALUES ('18', '<p class=\"MsoNormal\">\r\n	以下代码的运行结果为\r\n</p>\r\n<p class=\"MsoNormal\">\r\n<pre class=\"prettyprint lang-java\">public class OuterClass {\r\n	private class InterClass {\r\n		public InterClass() {\r\n			System.out.println(\"InterClass Create\");\r\n		} \r\n	}\r\n	public OuterClass() {\r\n		InterClass ic = new InterClass();\r\n		System.out.println(\"OuterClass Create\");\r\n	}\r\n	public static void main(String[] args) {\r\n		OuterClass oc = new OuterClass();\r\n	} \r\n}</pre>\r\n</p>', '2', '12', '1', '0');
INSERT INTO `question` VALUES ('19', '<p class=\"MsoNormal\">\r\n	Java<span>中的集合类包括</span><span>ArrayList</span><span>、</span><span>LinkedList</span><span>、</span><span>HashMap</span><span>等类，下列关于集合类描述错误的是?</span>\r\n</p>', '1', '17', '1', '0');
INSERT INTO `question` VALUES ('20', '<p class=\"MsoNormal\">\r\n	以下程序的运行结果为\r\n</p>\r\n<p class=\"MsoNormal\">\r\n<pre class=\"prettyprint lang-java\">public class Test {\r\npublic int div(int a, int b) {\r\n	try {\r\n		return a / b;\r\n	}catch(Exception e){\r\n		System.out.println(\"Exception\");\r\n	}catch(NullPointerException e){\r\n		System.out.println(\"ArithmeticException\");\r\n	}catch (ArithmeticException e) {\r\n		System.out.println(\"ArithmeticException\");\r\n	} finally {\r\n		System.out.println(\"finally\");\r\n	}\r\n	return 0;\r\n	}\r\npublic static void main(String[] args) {\r\n		Test demo = new Test();\r\n		System.out.println(\"商是：\" + demo.div(9, 0));\r\n	}\r\n}</pre>\r\n</p>', '1', '22', '1', '0');
