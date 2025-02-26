// class TextModel {
//   List<String> assiserviceName = [
//     'Transportation',
//     'Shopping',
//     'Personal Assistant',
//     'Hospital Companion'
//   ];
//   List<String> assiserviceDesc = [
//     'A convenient and reliable service designed to support individuals in safely and comfortably reaching their destinations. Our trained professionals offer help with scheduling, coordination, and providing transportation to medical appointments, social events, and daily errands. Emphasizing safety, punctuality, and comfort, this service ensures individuals can travel with ease and confidence.',
//     'A convenient and personalized service designed to support individuals in managing their shopping needs. Our trained professionals offer help with making shopping lists, grocery shopping, and purchasing personal items, ensuring that all your needs are met efficiently and conveniently. Emphasizing care, attention to detail, and respect for your preferences, this service helps individuals enjoy a stress-free and organized shopping experience.',
//     'A highly organized and resourceful professional dedicated to supporting individuals in managing their daily tasks and schedules. Trained to handle administrative duties, coordinate appointments, and provide logistical support, personal assistants ensure that your personal and professional life runs smoothly. Each assistant is skilled in communication, time management, and problem-solving, offering personalized and efficient service to meet your unique needs.',
//     'A dedicated and compassionate support system designed to assist patients during their hospital stay. Trained to provide emotional support, help with daily tasks, and ensure comfort, hospital companions offer a personalized and caring experience. Each companion is knowledgeable about hospital procedures and committed to the well-being of the patient, ensuring a smooth and comforting journey through recovery'
//   ];
//   List<String> careserviceName = [
//     'Hygiene and Toileting',
//     'Dressing Grooming',
//     'Companionship',
//     'Med Administration'
//   ];
//   List<String> careserviceDesc = [
//     'A critical and compassionate service designed to support individuals in maintaining their personal cleanliness and dignity. Our trained professionals provide assistance with bathing, grooming, and toileting to ensure that individuals feel comfortable and cared for. Emphasizing privacy, respect, and sensitivity, this service helps individuals maintain their hygiene, boosting their overall health and well-being.',
//     'A vital service designed to support individuals in maintaining their personal appearance and dignity. Our trained professionals provide assistance with dressing, grooming, and personal care to ensure that individuals feel confident and well-presented. Emphasizing privacy, respect, and sensitivity, this service helps individuals maintain their daily routines and boosts their overall well-being.',
//     'A compassionate and supportive service designed to provide individuals with emotional and social interaction. Our trained companions offer conversation, activities, and a listening ear to enhance the well-being and quality of life of those they serve. Emphasizing empathy, respect, and genuine connection, this service helps individuals feel valued, less isolated, and more engaged in their daily lives.',
//     'A crucial service provided by healthcare professionals to ensure patients receive their prescribed medications accurately and safely. This involves preparing the correct dosage, administering it at the right time, and monitoring for any adverse reactions. Proper medication administration helps in effective treatment and recovery, ensuring patient safety and well-being.'
//   ];
//   List<String> houseserviceName = [
//     'Meal preparing',
//     'Laundry',
//     'cleaning',
//   ];
//   List<String> houseserviceDesc = [
//     'A valuable service designed to support individuals in planning, preparing, and enjoying nutritious meals. Our trained professionals offer help with grocery shopping, meal planning, and cooking to ensure that individuals receive balanced and delicious meals tailored to their dietary needs and preferences. Emphasizing health, taste, and convenience, this service helps individuals maintain a healthy lifestyle and enjoy their meals without the stress of preparation.',
//     'A convenient and essential service designed to support individuals in managing their laundry needs. Our trained professionals offer help with washing, drying, folding, and ironing clothes to ensure they are clean, fresh, and well-maintained. Emphasizing care, efficiency, and attention to detail, this service helps individuals maintain a neat and organized wardrobe without the hassle of doing laundry themselves.',
//     'A convenient and essential service designed to support individuals in maintaining a clean and organized living space. Our trained professionals offer help with dusting, vacuuming, mopping, and general tidying to ensure your home is spotless and comfortable. Emphasizing efficiency, attention to detail, and respect for your personal space, this service helps individuals enjoy a clean and hygienic environment without the hassle of doing it themselves.',
//   ];

// }
class ServiceModel {
  final String name;
  final String description;
  final String imageUrl;

  ServiceModel({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class TextModel {
  List<ServiceModel> assiservices = [
    ServiceModel(
      name: 'Transportation',
      description:
          'A convenient and reliable service designed to support individuals in safely and comfortably reaching their destinations...',
      imageUrl:
          'https://cdn.dribbble.com/userupload/23154695/file/original-95c4f350244238203245af789ee5ba7e.gif',
    ),
    ServiceModel(
      name: 'Shopping',
      description:
          'A convenient and personalized service designed to support individuals in managing their shopping needs...',
      imageUrl:
          'https://cdn.dribbble.com/userupload/21903715/file/original-2297feaec1ba5f6406c8694d0880aae9.gif',
    ),
    ServiceModel(
      name: 'Personal Assistant',
      description:
          'A highly organized and resourceful professional dedicated to supporting individuals...',
      imageUrl:
          'https://i.pinimg.com/originals/50/a8/57/50a857a7bbe36010c73c07792f1004f4.gif',
    ),
    ServiceModel(
      name: 'Hospital Companion',
      description:
          'A dedicated and compassionate support system designed to assist patients during their hospital stay...',
      imageUrl:
          'https://i.pinimg.com/originals/db/f3/c9/dbf3c92ca8525611209c7a5ac42405a3.gif',
    ),
  ];

  List<ServiceModel> careservices = [
    ServiceModel(
      name: 'Hygiene and Toileting',
      description:
          'A critical and compassionate service designed to support individuals in maintaining their personal cleanliness and dignity...',
      imageUrl: 'https://i.gifer.com/O6cw.gif',
    ),
    ServiceModel(
      name: 'Dressing Grooming',
      description:
          'A vital service designed to support individuals in maintaining their personal appearance and dignity...',
      imageUrl:
          'https://media.tenor.com/OgAGmSx8De8AAAAM/george-jetson-getting-dressed.gif',
    ),
    ServiceModel(
      name: 'Companionship',
      description:
          'A compassionate and supportive service designed to provide individuals with emotional and social interaction...',
      imageUrl:
          'https://cdn.dribbble.com/userupload/23049293/file/original-e4a717f34789285589643bdda641506f.gif',
    ),
    ServiceModel(
      name: 'Med Administration',
      description:
          'A crucial service provided by healthcare professionals to ensure patients receive their prescribed medications accurately and safely...',
      imageUrl:
          'https://i.pinimg.com/originals/ee/84/e6/ee84e6c4f71311cac5b0624e31ea9b51.gif',
    ),
  ];

  List<ServiceModel> houseservices = [
    ServiceModel(
      name: 'Meal Preparing',
      description:
          'A valuable service designed to support individuals in planning, preparing, and enjoying nutritious meals...',
      imageUrl:
          'https://cdn.dribbble.com/userupload/24942251/file/original-9c5cccaf493bcd4eec55b1835dfedc3d.gif',
    ),
    ServiceModel(
      name: 'Laundry',
      description:
          'A convenient and essential service designed to support individuals in managing their laundry needs...',
      imageUrl:
          'https://mir-s3-cdn-cf.behance.net/project_modules/hd/ed5a3179024277.5cbca8251c762.gif',
    ),
    ServiceModel(
      name: 'Cleaning',
      description:
          'A convenient and essential service designed to support individuals in maintaining a clean and organized living space...',
      imageUrl:
          'https://i.pinimg.com/originals/50/a8/57/50a857a7bbe36010c73c07792f1004f4.gif',
    ),
  ];
}
