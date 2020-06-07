class CVData{
  Map<String, dynamic> jobExperience;
  Map<String, dynamic> education;
  Map<String, dynamic> skills;
  Map<String, dynamic> languagesLVL;
  String additionalData;

  CVData.fromMap(Map<String, dynamic> map){
    jobExperience = Map.from(map['jobExperience']);
    education = Map.from(map['education']);
    skills = Map.from(map['skills']);
    languagesLVL = Map.from(map['languagesLVL']);
    additionalData = map['additionalData'];
  }

  Map<String, dynamic> asMap() => {
    'jobExperience': jobExperience,
    'education': education,
    'skills': skills,
    'languagesLVL': languagesLVL,
    'additionalData': additionalData,
  };
}