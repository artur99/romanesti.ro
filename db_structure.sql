-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2017 at 06:49 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `romanesti`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `slug` varchar(25) DEFAULT NULL,
  `judet` int(11) DEFAULT NULL,
  `coord_lat` double DEFAULT NULL,
  `coord_lng` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `judet`, `coord_lat`, `coord_lng`) VALUES
(1, '﻿Abrud', 'abrud', 1, 46.2684904, 23.079586029052734),
(2, 'Adjud', 'adjud', 41, 46.0961957, 27.18218994140625),
(3, 'Agnita', 'agnita', 34, 45.9791213, 24.61841583251953),
(4, 'Aiud', 'aiud', 1, 46.3086633, 23.724557876586914),
(5, 'Alba Iulia', 'alba-iulia', 1, 46.0823371, 23.569026947021484),
(6, 'Aleșd', 'alesd', 0, 47.0996156, 22.412151336669922),
(7, 'Alexandria', 'alexandria', 36, 43.9750572, 25.328258514404297),
(8, 'Amara', 'amara', 23, 44.6496274, 27.31479835510254),
(9, 'Anina', 'anina', 11, 45.0214973, 21.852785110473633),
(10, 'Aninoasa', 'aninoasa', 22, 45.3781928, 23.333703994750977),
(11, 'Arad', 'arad', 2, 46.1865606, 21.312267303466797),
(12, 'Ardud', 'ardud', 32, 47.6264559, 22.900766372680664),
(13, 'Avrig', 'avrig', 34, 45.6949188, 24.406173706054688),
(14, 'Azuga', 'azuga', 31, 45.4450965, 25.570035934448242),
(15, 'Babadag', 'babadag', 38, 44.9092818, 28.716196060180664),
(16, 'Băbeni', 'babeni', 0, 44.9737332, 24.247886657714844),
(17, 'Bacău', 'bacau', 4, 46.5670437, 26.914575576782227),
(18, 'Baia de Aramă', 'baia-de-arama', 27, 45.0122777, 22.804166793823242),
(19, 'Baia de Arieș', 'baia-de-aries', 1, 46.3806546, 23.282291412353516),
(20, 'Baia Mare', 'baia-mare', 26, 47.6567387, 23.58498764038086),
(21, 'Baia Sprie', 'baia-sprie', 26, 47.668002, 23.724336624145508),
(22, 'Băicoi', 'baicoi', 31, 45.028435, 25.8814697265625),
(23, 'Băile Govora', 'baile-govora', 40, 45.0818794, 24.184703826904297),
(24, 'Băile Herculane', 'baile-herculane', 11, 44.8681802, 22.408512115478516),
(25, 'Băile Olănești', 'baile-olanesti', 40, 45.234106, 24.19119644165039),
(26, 'Băile Tușnad', 'baile-tusnad', 21, 46.1460752, 25.856958389282227),
(27, 'Băilești', 'bailesti', 17, 44.0268817, 23.34540557861328),
(28, 'Bălan', 'balan', 21, 46.6484577, 25.812206268310547),
(29, 'Bălcești', 'balcesti', 40, 44.6132375, 23.925565719604492),
(30, 'Balș', 'bals', 30, 44.3397257, 24.102214813232422),
(31, 'Băneasa', 'baneasa', 14, 44.0678548, 27.683815002441406),
(32, 'Baraolt', 'baraolt', 15, 46.0753937, 25.60504722595215),
(33, 'Bârlad', 'barlad', 39, 46.2276613, 27.669225692749023),
(34, 'Bechet', 'bechet', 0, 43.7736169, 23.953815460205078),
(35, 'Beclean', 'beclean', 5, 47.1712577, 24.186664581298828),
(36, 'Beiuș', 'beius', 0, 46.6674534, 22.357572555541992),
(37, 'Berbești', 'berbesti', 40, 44.9924007, 23.89917755126953),
(38, 'Berești', 'beresti', 18, 46.0880133, 27.866350173950195),
(39, 'Bicaz', 'bicaz', 29, 46.9644224, 26.004329681396484),
(40, 'Bistrița', 'bistrita', 5, 47.1392617, 24.489097595214844),
(41, 'Blaj', 'blaj', 1, 46.1802331, 23.92791748046875),
(42, 'Bocșa', 'bocsa', 11, 45.3868427, 21.792909622192383),
(43, 'Boldești-Scăeni', 'boldesti-scaeni', 31, 45.0296322, 26.040504455566406),
(44, 'Bolintin-Vale', 'bolintin-vale', 19, 44.4474639, 25.764667510986328),
(45, 'Borșa', 'borsa', 26, 47.6646431, 24.71852684020996),
(46, 'Borsec', 'borsec', 21, 46.9758153, 25.5692081451416),
(47, 'Botoșani', 'botosani', 6, 47.7406537, 26.665813446044922),
(48, 'Brad', 'brad', 22, 46.1335267, 22.788423538208008),
(49, 'Bragadiru', 'bragadiru', 25, 44.3840419, 26.005840301513672),
(50, 'Brăila', 'braila', 8, 45.2652463, 27.959470748901367),
(51, 'Brașov', 'brasov', 7, 45.6579755, 25.601198196411133),
(52, 'Breaza', 'breaza', 31, 45.187222, 25.662221908569336),
(53, 'Brezoi', 'brezoi', 40, 45.3895559, 24.20782470703125),
(54, 'Broșteni', 'brosteni', 35, 47.2161784, 25.651546478271484),
(55, 'Bucecea', 'bucecea', 6, 47.7688056, 26.446186065673828),
(56, 'București', 'bucuresti', 0, 44.4267674, 26.1025390625),
(57, 'Budești', 'budesti', 12, 44.2412653, 26.426132202148438),
(58, 'Buftea', 'buftea', 25, 44.5543808, 25.953855514526367),
(59, 'Buhuși', 'buhusi', 4, 46.7409845, 26.698104858398438),
(60, 'Bumbești-Jiu', 'bumbesti-jiu', 20, 45.1776245, 23.385616302490234),
(61, 'Bușteni', 'busteni', 31, 45.4140642, 25.526519775390625),
(62, 'Buzău', 'buzau', 10, 45.1371109, 26.81711196899414),
(63, 'Buziaș', 'buzias', 37, 45.6182024, 21.62270164489746),
(64, 'Cajvana', 'cajvana', 35, 47.7019688, 25.96411895751953),
(65, 'Calafat', 'calafat', 17, 43.9897523, 22.934114456176758),
(66, 'Călan', 'calan', 22, 45.7431053, 23.0003662109375),
(67, 'Călărași', 'calarasi', 12, 44.2085144, 27.313743591308594),
(68, 'Călimănești', 'calimanesti', 40, 45.2887007, 24.301902770996094),
(69, 'Câmpeni', 'campeni', 1, 46.3990475, 23.03619384765625),
(70, 'Câmpia Turzii', 'campia-turzii', 13, 46.5586485, 23.870668411254883),
(71, 'Câmpina', 'campina', 31, 45.1369957, 25.742141723632812),
(72, 'Câmpulung Moldovenesc', 'campulung-moldovenesc', 35, 47.5257007, 25.570749282836914),
(73, 'Câmpulung', 'campulung', 3, 45.270605, 25.053104400634766),
(74, 'Caracal', 'caracal', 30, 44.1157446, 24.34247589111328),
(75, 'Caransebeș', 'caransebes', 11, 45.413619, 22.221864700317383),
(76, 'Carei', 'carei', 32, 47.6814513, 22.462142944335938),
(77, 'Cavnic', 'cavnic', 26, 47.6644753, 23.85909652709961),
(78, 'Căzănești', 'cazanesti', 23, 44.6450375, 27.02216339111328),
(79, 'Cehu Silvaniei', 'cehu-silvaniei', 33, 47.4120157, 23.17997169494629),
(80, 'Cernavodă', 'cernavoda', 14, 44.3375442, 28.04926300048828),
(81, 'Chișineu-Criș', 'chisineu-cris', 2, 46.4874021, 21.51848602294922),
(82, 'Chitila', 'chitila', 25, 44.5046813, 25.975608825683594),
(83, 'Ciacova', 'ciacova', 37, 45.5097797, 21.12982177734375),
(84, 'Cisnădie', 'cisnadie', 34, 45.6247632, 24.09433364868164),
(85, 'Cluj-Napoca', 'cluj-napoca', 13, 46.7712101, 23.62363624572754),
(86, 'Codlea', 'codlea', 7, 45.6976693, 25.456071853637695),
(87, 'Comănești', 'comanesti', 4, 46.4131757, 26.4361629486084),
(88, 'Comarnic', 'comarnic', 31, 45.2488709, 25.64080238342285),
(89, 'Constanța', 'constanta', 14, 44.1598013, 28.63481330871582),
(90, 'Copșa Mică', 'copsa-mica', 34, 46.1172183, 24.244064331054688),
(91, 'Corabia', 'corabia', 0, 43.7910064, 24.517656326293945),
(92, 'Costești', 'costesti', 3, 44.7137765, 24.867568969726562),
(93, 'Covasna', 'covasna', 0, 45.8472767, 26.1783447265625),
(94, 'Craiova', 'craiova', 17, 44.3301785, 23.794879913330078),
(95, 'Cristuru Secuiesc', 'cristuru-secuiesc', 21, 46.2924526, 25.031715393066406),
(96, 'Cugir', 'cugir', 1, 45.8370606, 23.367507934570312),
(97, 'Curtea de Argeș', 'curtea-de-arges', 3, 45.1405966, 24.66851806640625),
(98, 'Curtici', 'curtici', 2, 46.3509667, 21.29107093811035),
(99, 'Dăbuleni', 'dabuleni', 0, 43.8050078, 24.11469841003418),
(100, 'Darabani', 'darabani', 6, 48.195562, 26.59086036682129),
(101, 'Dărmănești', 'darmanesti', 4, 46.3355703, 26.375471115112305),
(102, 'Dej', 'dej', 13, 47.1415878, 23.878734588623047),
(103, 'Deta', 'deta', 37, 45.4127306, 21.2116756439209),
(104, 'Deva', 'deva', 22, 45.8662574, 22.91437339782715),
(105, 'Dolhasca', 'dolhasca', 35, 47.413704, 26.600730895996094),
(106, 'Dorohoi', 'dorohoi', 6, 47.9549207, 26.401208877563477),
(107, 'Drăgănești-Olt', 'draganesti-olt', 30, 44.1785483, 24.557235717773438),
(108, 'Drăgășani', 'dragasani', 40, 44.6631799, 24.26087188720703),
(109, 'Dragomirești', 'dragomiresti', 26, 47.6118872, 24.259870529174805),
(110, 'Drobeta-Turnu Severin', 'drobeta-turnu-severin', 27, 44.6369227, 22.65973472595215),
(111, 'Dumbrăveni', 'dumbraveni', 34, 46.2287307, 24.54654884338379),
(112, 'Eforie', 'eforie', 14, 44.0584223, 28.63360595703125),
(113, 'Făgăraș', 'fagaras', 7, 45.8416403, 24.973094940185547),
(114, 'Făget', 'faget', 37, 45.8641395, 22.17839813232422),
(115, 'Fălticeni', 'falticeni', 35, 47.4615626, 26.301528930664062),
(116, 'Făurei', 'faurei', 8, 45.0892951, 27.260644912719727),
(117, 'Fetești', 'fetesti', 23, 44.3687237, 27.828563690185547),
(118, 'Fieni', 'fieni', 16, 45.1362883, 25.411418914794922),
(119, 'Fierbinți-Târg', 'fierbinti-targ', 23, 44.6800064, 26.379261016845703),
(120, 'Filiași', 'filiasi', 0, 44.5538827, 23.52896499633789),
(121, 'Flămânzi', 'flamanzi', 6, 47.5576265, 26.878337860107422),
(122, 'Focșani', 'focsani', 41, 45.6964745, 27.184043884277344),
(123, 'Frasin', 'frasin', 35, 47.5404286, 25.794105529785156),
(124, 'Fundulea', 'fundulea', 12, 44.4640645, 26.510927200317383),
(125, 'Găești', 'gaesti', 16, 44.719706, 25.316213607788086),
(126, 'Galați', 'galati', 18, 45.4353208, 28.007993698120117),
(127, 'Gătaia', 'gataia', 37, 45.3450804, 21.40733528137207),
(128, 'Geoagiu', 'geoagiu', 22, 45.9295876, 23.205387115478516),
(129, 'Gheorgheni', 'gheorgheni', 21, 46.7212112, 25.585527420043945),
(130, 'Gherla', 'gherla', 13, 47.0317645, 23.909252166748047),
(131, 'Ghimbav', 'ghimbav', 7, 45.6629503, 25.5064697265625),
(132, 'Giurgiu', 'giurgiu', 19, 43.9360169, 26.029186248779297),
(133, 'Gura Humorului', 'gura-humorului', 35, 47.5296056, 25.871667861938477),
(134, 'Hârlău', 'harlau', 24, 47.4220403, 26.9239501953125),
(135, 'Hârșova', 'harsova', 27, 44.7284621, 22.394325256347656),
(136, 'Hațeg', 'hateg', 22, 45.63622, 22.940107345581055),
(137, 'Horezu', 'horezu', 40, 45.2021834, 23.978832244873047),
(138, 'Huedin', 'huedin', 13, 46.8737583, 23.004121780395508),
(139, 'Hunedoara', 'hunedoara', 22, 45.7678128, 22.9072322845459),
(140, 'Huși', 'husi', 39, 46.6758644, 28.058990478515625),
(141, 'Ianca', 'ianca', 8, 45.115371, 27.49065399169922),
(142, 'Iași', 'iasi', 24, 47.1584549, 27.601442337036133),
(143, 'Iernut', 'iernut', 26, 46.4507604, 24.229015350341797),
(144, 'Ineu', 'ineu', 2, 46.4138774, 21.83814811706543),
(145, 'Însurăței', 'insuratei', 8, 44.9220989, 27.614194869995117),
(146, 'Întorsura Buzăului', 'intorsura-buzaului', 0, 45.681105, 26.007465362548828),
(147, 'Isaccea', 'isaccea', 38, 45.2678129, 28.442516326904297),
(148, 'Jibou', 'jibou', 33, 47.2728699, 23.251239776611328),
(149, 'Jimbolia', 'jimbolia', 37, 45.7866353, 20.753429412841797),
(150, 'Lehliu Gară', 'lehliu-gara', 12, 44.4370845, 26.854467391967773),
(151, 'Lipova', 'lipova', 2, 46.081601, 21.693132400512695),
(152, 'Liteni', 'liteni', 35, 47.5149371, 26.53260612487793),
(153, 'Livada', 'livada', 32, 47.8731165, 23.11119842529297),
(154, 'Luduș', 'ludus', 26, 46.4945916, 24.09022331237793),
(155, 'Lugoj', 'lugoj', 37, 45.6909898, 21.903461456298828),
(156, 'Lupeni', 'lupeni', 22, 45.3569989, 23.21322250366211),
(157, 'Măcin', 'macin', 38, 45.2557426, 28.147502899169922),
(158, 'Măgurele', 'magurele', 25, 44.3461496, 25.99994468688965),
(159, 'Mangalia', 'mangalia', 14, 43.8152436, 28.57415008544922),
(160, 'Mărășești', 'marasesti', 41, 45.8858367, 27.222339630126953),
(161, 'Marghita', 'marghita', 0, 47.3479194, 22.33975601196289),
(162, 'Medgidia', 'medgidia', 14, 44.2416271, 28.277732849121094),
(163, 'Mediaș', 'medias', 34, 46.1572828, 24.347166061401367),
(164, 'Miercurea Ciuc', 'miercurea-ciuc', 21, 46.3695574, 25.795366287231445),
(165, 'Miercurea Nirajului', 'miercurea-nirajului', 26, 46.5502449, 24.74625587463379),
(166, 'Miercurea Sibiului', 'miercurea-sibiului', 34, 45.8900539, 23.791765213012695),
(167, 'Mihăilești', 'mihailesti', 19, 44.3046203, 25.9284610748291),
(168, 'Milișăuți', 'milisauti', 35, 47.785723, 25.999616622924805),
(169, 'Mioveni', 'mioveni', 3, 44.9545221, 24.937068939208984),
(170, 'Mizil', 'mizil', 31, 44.9981642, 26.44176483154297),
(171, 'Moinești', 'moinesti', 4, 46.4697857, 26.488462448120117),
(172, 'Moldova Nouă', 'moldova-noua', 11, 44.7860578, 21.664840698242188),
(173, 'Moreni', 'moreni', 16, 44.9820431, 25.64021110534668),
(174, 'Motru', 'motru', 20, 44.8027376, 22.972856521606445),
(175, 'Murfatlar', 'murfatlar', 14, 44.1638826, 28.36369514465332),
(176, 'Murgeni', 'murgeni', 39, 46.2125425, 27.981618881225586),
(177, 'Nădlac', 'nadlac', 2, 46.1730001, 20.811647415161133),
(178, 'Năsăud', 'nasaud', 5, 47.3080084, 24.40766716003418),
(179, 'Năvodari', 'navodari', 14, 44.3304107, 28.593137741088867),
(180, 'Negrești', 'negresti', 39, 46.8360113, 27.46933937072754),
(181, 'Negrești-Oaș', 'negresti-oas', 32, 47.8500001, 23.46278953552246),
(182, 'Negru Vodă', 'negru-voda', 14, 43.8155851, 28.217620849609375),
(183, 'Nehoiu', 'nehoiu', 10, 45.4162973, 26.299100875854492),
(184, 'Novaci', 'novaci', 20, 45.1782926, 23.672086715698242),
(185, 'Nucet', 'nucet', 0, 46.4867294, 22.558156967163086),
(186, 'Ocna Mureș', 'ocna-mures', 1, 46.3650348, 23.84876251220703),
(187, 'Ocna Sibiului', 'ocna-sibiului', 34, 45.8833771, 24.014896392822266),
(188, 'Ocnele Mari', 'ocnele-mari', 40, 45.083333, 24.316667556762695),
(189, 'Odobești', 'odobesti', 41, 45.7601878, 27.064640045166016),
(190, 'Odorheiu Secuiesc', 'odorheiu-secuiesc', 21, 46.3049996, 25.292648315429688),
(191, 'Oltenița', 'oltenita', 12, 44.0854664, 26.637483596801758),
(192, 'Onești', 'onesti', 4, 46.2647012, 26.7825870513916),
(193, 'Oradea', 'oradea', 0, 47.0465005, 21.918943405151367),
(194, 'Orăștie', 'orastie', 22, 45.8451246, 23.201927185058594),
(195, 'Oravița', 'oravita', 11, 45.0517004, 21.70158576965332),
(196, 'Orșova', 'orsova', 27, 44.7284621, 22.394325256347656),
(197, 'Oțelu Roșu', 'otelu-rosu', 11, 45.5158698, 22.350425720214844),
(198, 'Otopeni', 'otopeni', 25, 44.5616578, 26.08591651916504),
(199, 'Ovidiu', 'ovidiu', 14, 44.2467478, 28.534576416015625),
(200, 'Panciu', 'panciu', 41, 45.889737, 27.12735366821289),
(201, 'Pâncota', 'pancota', 2, 46.3284025, 21.68666648864746),
(202, 'Pantelimon', 'pantelimon', 25, 44.4582005, 26.265832901000977),
(203, 'Pașcani', 'pascani', 24, 47.2411237, 26.7233829498291),
(204, 'Pătârlagele', 'patarlagele', 0, 45.3201952, 26.32624626159668),
(205, 'Pecica', 'pecica', 2, 46.2031232, 21.071910858154297),
(206, 'Petrila', 'petrila', 22, 45.4437689, 23.409378051757812),
(207, 'Petroșani', 'petrosani', 22, 45.4088946, 23.375402450561523),
(208, 'Piatra Neamț', 'piatra-neamt', 29, 46.9299616, 26.377979278564453),
(209, 'Piatra-Olt', 'piatra-olt', 30, 44.3602914, 24.27083969116211),
(210, 'Pitești', 'pitesti', 3, 44.8564798, 24.869182586669922),
(211, 'Ploiești', 'ploiesti', 31, 44.936664, 26.012861251831055),
(212, 'Plopeni', 'plopeni', 31, 45.0458318, 25.953598022460938),
(213, 'Podu Iloaiei', 'podu-iloaiei', 24, 47.2109327, 27.266464233398438),
(214, 'Pogoanele', 'pogoanele', 10, 44.8821856, 26.992027282714844),
(215, 'Popești-Leordeni', 'popesti-leordeni', 25, 44.3568583, 26.197187423706055),
(216, 'Potcoava', 'potcoava', 30, 44.476611, 24.618419647216797),
(217, 'Predeal', 'predeal', 7, 45.5133073, 25.573904037475586),
(218, 'Pucioasa', 'pucioasa', 16, 45.0718409, 25.45192527770996),
(219, 'Răcari', 'racari', 16, 44.6574558, 25.77313995361328),
(220, 'Rădăuți', 'radauti', 35, 47.8408505, 25.913829803466797),
(221, 'Râmnicu Sărat', 'ramnicu-sarat', 10, 45.3864635, 27.046222686767578),
(222, 'Râmnicu Vâlcea', 'ramnicu-valcea', 40, 45.0996753, 24.36931800842285),
(223, 'Râșnov', 'rasnov', 7, 45.5379615, 25.470613479614258),
(224, 'Recaș', 'recas', 37, 45.8302255, 21.553409576416016),
(225, 'Reghin', 'reghin', 26, 46.7710931, 24.700761795043945),
(226, 'Reșița', 'resita', 11, 45.3049703, 21.882102966308594),
(227, 'Roman', 'roman', 29, 46.9333781, 26.926544189453125),
(228, 'Roșiorii de Vede', 'rosiorii-de-vede', 36, 44.1085569, 24.994977951049805),
(229, 'Rovinari', 'rovinari', 20, 44.9206186, 23.143964767456055),
(230, 'Roznov', 'roznov', 29, 46.8380096, 26.5074405670166),
(231, 'Rupea', 'rupea', 7, 46.0603679, 25.185882568359375),
(232, 'Săcele', 'sacele', 7, 45.6179752, 25.69425392150879),
(233, 'Săcueni', 'sacueni', 0, 47.3388613, 22.093896865844727),
(234, 'Salcea', 'salcea', 35, 47.643301, 26.35507583618164),
(235, 'Săliște', 'saliste', 34, 45.8164656, 23.908802032470703),
(236, 'Săliștea de Sus', 'salistea-de-sus', 26, 47.6576229, 24.35248374938965),
(237, 'Salonta', 'salonta', 0, 46.8052877, 21.648983001708984),
(238, 'Sângeorgiu de Pădure', 'sangeorgiu-de-padure', 26, 46.4291872, 24.838638305664062),
(239, 'Sângeorz-Băi', 'sangeorz-bai', 5, 47.3640822, 24.67507553100586),
(240, 'Sânnicolau Mare', 'sannicolau-mare', 37, 46.0419167, 20.609338760375977),
(241, 'Sântana', 'santana', 2, 46.3276193, 21.512880325317383),
(242, 'Sărmașu', 'sarmasu', 26, 46.7455808, 24.156511306762695),
(243, 'Satu Mare', 'satu-mare', 32, 47.8016702, 22.857593536376953),
(244, 'Săveni', 'saveni', 6, 47.9590435, 26.85922622680664),
(245, 'Scornicești', 'scornicesti', 30, 44.5591625, 24.557252883911133),
(246, 'Sebeș', 'sebes', 1, 45.9595588, 23.566375732421875),
(247, 'Sebiș', 'sebis', 2, 46.3792425, 22.159610748291016),
(248, 'Segarcea', 'segarcea', 0, 44.0918691, 23.733388900756836),
(249, 'Seini', 'seini', 26, 47.7475078, 23.28491973876953),
(250, 'Sfântu Gheorghe', 'sfantu-gheorghe', 0, 45.8609375, 25.7885799407959),
(251, 'Sibiu', 'sibiu', 34, 45.7983273, 24.125581741333008),
(252, 'Sighetu Marmației', 'sighetu-marmatiei', 26, 47.927707, 23.89764976501465),
(253, 'Sighișoara', 'sighisoara', 26, 46.2197025, 24.796388626098633),
(254, 'Simeria', 'simeria', 22, 45.8555725, 23.012086868286133),
(255, 'Șimleu Silvaniei', 'simleu-silvaniei', 33, 47.2245895, 22.79859733581543),
(256, 'Sinaia', 'sinaia', 31, 45.3466159, 25.556867599487305),
(257, 'Siret', 'siret', 35, 47.9513554, 26.04755210876465),
(258, 'Slănic', 'slanic', 31, 45.2536956, 25.942182540893555),
(259, 'Slănic-Moldova', 'slanic-moldova', 4, 46.2024392, 26.45658302307129),
(260, 'Slatina', 'slatina', 30, 44.4301677, 24.37169075012207),
(261, 'Slobozia', 'slobozia', 23, 44.5628889, 27.361366271972656),
(262, 'Solca', 'solca', 35, 47.7119699, 25.813617706298828),
(263, 'Șomcuta Mare', 'somcuta-mare', 26, 47.4878247, 23.501636505126953),
(264, 'Sovata', 'sovata', 26, 46.5990794, 25.077436447143555),
(265, 'Ștefănești, Argeș', 'stefanesti-arges', 3, 44.8716933, 24.95269012451172),
(266, 'Ștefănești, Botoșani', 'stefanesti-botosani', 6, 47.7931853, 27.192956924438477),
(267, 'Ștei', 'stei', 0, 46.5342537, 22.46300506591797),
(268, 'Strehaia', 'strehaia', 27, 44.6296591, 23.17793083190918),
(269, 'Suceava', 'suceava', 35, 47.6634521, 26.273229598999023),
(270, 'Sulina', 'sulina', 38, 45.0994097, 29.564706802368164),
(271, 'Tălmaciu', 'talmaciu', 34, 45.5686609, 24.121479034423828),
(272, 'Țăndărei', 'tandarei', 23, 44.6488718, 27.64386749267578),
(273, 'Târgoviște', 'targoviste', 16, 44.9118218, 25.455827713012695),
(274, 'Târgu Bujor', 'targu-bujor', 18, 45.8648143, 27.931556701660156),
(275, 'Târgu Cărbunești', 'targu-carbunesti', 20, 44.9600347, 23.462778091430664),
(276, 'Târgu Frumos', 'targu-frumos', 24, 47.2131964, 27.000364303588867),
(277, 'Târgu Jiu', 'targu-jiu', 20, 45.0314279, 23.268939971923828),
(278, 'Târgu Lăpuș', 'targu-lapus', 26, 47.453234, 23.86178970336914),
(279, 'Târgu Mureș', 'targu-mures', 26, 46.5385862, 24.55143928527832),
(280, 'Târgu Neamț', 'targu-neamt', 29, 47.195118, 26.38214111328125),
(281, 'Târgu Ocna', 'targu-ocna', 4, 46.2777066, 26.61818504333496),
(282, 'Târgu Secuiesc', 'targu-secuiesc', 0, 46.0006001, 26.134578704833984),
(283, 'Târnăveni', 'tarnaveni', 26, 46.3293137, 24.293577194213867),
(284, 'Tășnad', 'tasnad', 32, 47.4842932, 22.590621948242188),
(285, 'Tăuții-Măgherăuș', 'tautii-magheraus', 26, 47.7445312, 23.516372680664062),
(286, 'Techirghiol', 'techirghiol', 14, 44.0554763, 28.589885711669922),
(287, 'Tecuci', 'tecuci', 18, 45.8490923, 27.42412757873535),
(288, 'Teiuș', 'teius', 1, 46.2122418, 23.713964462280273),
(289, 'Țicleni', 'ticleni', 20, 44.8938425, 23.405397415161133),
(290, 'Timișoara', 'timisoara', 37, 45.7488716, 21.20867919921875),
(291, 'Tismana', 'tismana', 20, 45.1127736, 22.933696746826172),
(292, 'Titu', 'titu', 16, 44.64022, 25.57769203186035),
(293, 'Toplița', 'toplita', 21, 46.9260303, 25.353404998779297),
(294, 'Topoloveni', 'topoloveni', 3, 44.8199458, 25.08968162536621),
(295, 'Tulcea', 'tulcea', 38, 45.1716165, 28.791444778442383),
(296, 'Turceni', 'turceni', 20, 44.6795151, 23.354671478271484),
(297, 'Turda', 'turda', 13, 46.564676, 23.79710578918457),
(298, 'Turnu Măgurele', 'turnu-magurele', 36, 43.7517061, 24.87739372253418),
(299, 'Ulmeni', 'ulmeni', 26, 47.4529017, 23.279037475585938),
(300, 'Ungheni', 'ungheni', 26, 46.4801659, 24.426380157470703),
(301, 'Uricani', 'uricani', 22, 45.340086, 23.15338706970215),
(302, 'Urlați', 'urlati', 31, 44.995602, 26.260467529296875),
(303, 'Urziceni', 'urziceni', 23, 44.718056, 26.645278930664062),
(304, 'Valea lui Mihai', 'valea-lui-mihai', 0, 47.5257066, 22.136804580688477),
(305, 'Vălenii de Munte', 'valenii-de-munte', 31, 45.1912847, 26.044017791748047),
(306, 'Vânju Mare', 'vanju-mare', 27, 44.4095087, 22.887401580810547),
(307, 'Vașcău', 'vascau', 0, 46.4626778, 22.442171096801758),
(308, 'Vaslui', 'vaslui', 39, 46.6406915, 27.727645874023438),
(309, 'Vatra Dornei', 'vatra-dornei', 35, 47.3447576, 25.35210418701172),
(310, 'Vicovu de Sus', 'vicovu-de-sus', 0, 47.9146884, 25.672670364379883),
(311, 'Victoria', 'victoria', 7, 45.7306587, 24.7009220123291),
(312, 'Videle', 'videle', 36, 44.2755977, 25.560876846313477),
(313, 'Vișeu de Sus', 'viseu-de-sus', 26, 47.7150521, 24.439672470092773),
(314, 'Vlăhița', 'vlahita', 21, 46.3581975, 25.5651798248291),
(315, 'Voluntari', 'voluntari', 25, 44.5050832, 26.15554428100586),
(316, 'Vulcan', 'vulcan', 22, 45.3780908, 23.288129806518555),
(317, 'Zalău', 'zalau', 33, 47.1854562, 23.05733299255371),
(318, 'Zărnești', 'zarnesti', 7, 45.5991402, 25.212196350097656),
(319, 'Zimnicea', 'zimnicea', 36, 43.671096, 25.36562156677246),
(320, 'Zlatna', 'zlatna', 1, 46.1328719, 23.195119857788086);

-- --------------------------------------------------------

--
-- Table structure for table `judete`
--

CREATE TABLE `judete` (
  `id` int(11) NOT NULL,
  `nume` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `judete`
--

INSERT INTO `judete` (`id`, `nume`) VALUES
(1, 'Alba'),
(2, 'Arad'),
(3, 'Argeș'),
(4, 'Bacău'),
(5, 'Bistrița-Năsăud'),
(6, 'Botoșani'),
(7, 'Brașov'),
(8, 'Brăila'),
(9, 'București'),
(10, 'Buzău'),
(11, 'Caraș-Severin'),
(12, 'Călărași'),
(13, 'Cluj'),
(14, 'Constanța'),
(15, 'Covansa'),
(16, 'Dâmbovița'),
(17, 'Dolj'),
(18, 'Galați'),
(19, 'Giurgiu'),
(20, 'Gorj'),
(21, 'Harghita'),
(22, 'Hunedoara'),
(23, 'Ialomița'),
(24, 'Iași'),
(25, 'Ilfov'),
(26, 'Maramureș'),
(27, 'Mehedinți'),
(28, 'Mureș'),
(29, 'Neamț'),
(30, 'Olt'),
(31, 'Prahova'),
(32, 'Satu Mare'),
(33, 'Sălaj'),
(34, 'Sibiu'),
(35, 'Suceava'),
(36, 'Teleorman'),
(37, 'Timiș'),
(38, 'Tulcea'),
(39, 'Vaslui'),
(40, 'Vâlcea'),
(41, 'Vrancea');

-- --------------------------------------------------------

--
-- Table structure for table `magazine_fizice`
--

CREATE TABLE `magazine_fizice` (
  `id` int(11) NOT NULL,
  `id_oras` int(11) NOT NULL,
  `nume` text NOT NULL,
  `nume_firma` text,
  `nat_firma` varchar(2) DEFAULT NULL,
  `nat_detinator` varchar(2) DEFAULT NULL,
  `coord_lat` double DEFAULT NULL,
  `coord_lng` double DEFAULT NULL,
  `tip` text,
  `romanesc` tinyint(1) NOT NULL DEFAULT '0',
  `etichete` text,
  `popularitate` int(1) DEFAULT NULL,
  `descriere` text,
  `logo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magazine_fizice`
--

INSERT INTO `magazine_fizice` (`id`, `id_oras`, `nume`, `nume_firma`, `nat_firma`, `nat_detinator`, `coord_lat`, `coord_lng`, `tip`, `romanesc`, `etichete`, `popularitate`, `descriere`, `logo`) VALUES
(1, 115, 'Lidl', 'Lidl Stiftung & Co. KG', 'de', 'de', 47.4503031, 26.295875, 'supermarket', 0, 'supermarket,lidl,alimentar', 8, NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Lidl_logo.png/220px-Lidl_logo.png'),
(2, 115, 'Kaufland', 'Schwarz Gruppe GmbH', 'de', 'de', 47.4564563, 26.3140672, 'supermarket', 0, 'supermarket,kaufland,alimentar', 8, NULL, 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Kaufland.png'),
(3, 115, 'Simos', 'Simos Com SRL', 'ro', 'ro', 47.461947, 26.2989, 'supermarket', 1, 'supermarket,simos,alimentar,fastfood,fast-food,', 2, NULL, NULL),
(4, 115, 'Altex', 'Altex Romania SRL', 'ro', 'ro', 47.4592836, 26.3018065, 'retailer', 1, 'electronice,electrocasnice,altex,it', 8, NULL, 'https://stat.altex.ro/media/theme/websites/1/altex-logo.png'),
(5, 115, 'Simos', 'Simos Com SRL', NULL, 'ro', 47.461489867502, 26.301974952221, 'supermarket', 1, 'supermarket,simos,alimentar', 2, '', ''),
(6, 72, 'Lidl', 'Lidl Stiftung & Co. KG', NULL, 'de', 47.526847755406, 25.566759416834, 'supermarket', 0, '', 8, '', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Lidl_logo.png/220px-Lidl_logo.png'),
(7, 72, 'Penny', 'Rewe', NULL, 'de', 47.528300275437, 25.564256832004, 'supermarket', 0, '', 8, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `producers`
--

CREATE TABLE `producers` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `com_name` text,
  `com_nat` varchar(2) DEFAULT NULL,
  `det_nat` varchar(2) DEFAULT NULL,
  `type` text,
  `romanesc` tinyint(1) NOT NULL DEFAULT '0',
  `products` text,
  `popularity` int(1) DEFAULT NULL,
  `description` text,
  `logo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producers`
--

INSERT INTO `producers` (`id`, `name`, `com_name`, `com_nat`, `det_nat`, `type`, `romanesc`, `products`, `popularity`, `description`, `logo`) VALUES
(1, 'ProdCom', 'Tipografia Prodcom SRL', 'ro', 'ro', 'birotica', 1, 'Caiete,Rechizite,Pliante,Birotică,Papetărie,Hârtie', 6, NULL, 'http://www.tipografiaprodcom.ro/files/api/images/logo.png'),
(2, 'Pigna', 'Pigna SLRC?!', 'it', 'it', 'birotica', 0, 'Caiete,Papetărie,Hârtie,Birotică', 9, NULL, 'http://pigna.ro/img/pigna-logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `sugestii`
--

CREATE TABLE `sugestii` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tip` varchar(30) NOT NULL,
  `data` text NOT NULL,
  `verificat` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sugestii`
--

INSERT INTO `sugestii` (`id`, `user_id`, `tip`, `data`, `verificat`) VALUES
(1, 2, 'magazin_fizic', '{"lat":47.461489867502,"lng":26.301974952221,"oras":"Falticeni","nume":"Simos","nume_firma":"Simos Com SRL","logo":"","nationalit":"RO","tip":"supermarket","etichete":"supermarket,simos,alimentar","popularitate":2,"descriere":"","id_oras":"115","nume_oras":"F\\u0103lticeni"}', 0),
(6, 2, 'magazin_fizic', '{"lat":47.517200697839,"lng":25.585441589355,"oras":"Campulung moldovenesc","nume":"test","nume_firma":"test","logo":"","nationalit":"AF","tip":"supermarket","etichete":"test","popularitate":2,"descriere":"test","id_oras":"72","nume_oras":"C\\u00e2mpulung Moldovenesc"}', 0),
(7, 2, 'magazin_fizic', '{"lat":47.526858622288,"lng":25.566534698009,"oras":"Campulung moldovenesc","nume":"Lidl","nume_firma":"Lidl Stiftung & Co. KG","logo":"https:\\/\\/upload.wikimedia.org\\/wikipedia\\/commons\\/thumb\\/1\\/1d\\/Lidl_logo.png\\/220px-Lidl_logo.png","nationalit":"DE","tip":"supermarket","etichete":"supermarket,lidl","popularitate":8,"descriere":"","id_oras":"72","nume_oras":"C\\u00e2mpulung Moldovenesc"}', 0),
(9, 3, 'magazin_fizic', '{"lat":47.526847755406,"lng":25.566759416834,"oras":"Campulung moldovenesc","nume":"Lidl","nume_firma":"Lidl Stiftung & Co. KG","logo":"https:\\/\\/upload.wikimedia.org\\/wikipedia\\/commons\\/thumb\\/1\\/1d\\/Lidl_logo.png\\/220px-Lidl_logo.png","nationalit":"DE","tip":"supermarket","etichete":"","popularitate":8,"descriere":"","id_oras":"72","nume_oras":"C\\u00e2mpulung Moldovenesc"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contribs` int(11) NOT NULL DEFAULT '0',
  `reg_tm` int(11) DEFAULT NULL,
  `log_tm` int(11) DEFAULT NULL,
  `reg_ip` varchar(15) DEFAULT NULL,
  `log_ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nume` (`name`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `judete`
--
ALTER TABLE `judete`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `magazine_fizice`
--
ALTER TABLE `magazine_fizice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_oras` (`id_oras`);

--
-- Indexes for table `producers`
--
ALTER TABLE `producers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sugestii`
--
ALTER TABLE `sugestii`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;
--
-- AUTO_INCREMENT for table `judete`
--
ALTER TABLE `judete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `magazine_fizice`
--
ALTER TABLE `magazine_fizice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `producers`
--
ALTER TABLE `producers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sugestii`
--
ALTER TABLE `sugestii`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
  
