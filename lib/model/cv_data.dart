class CVData{
  Map<String, dynamic> jobExperience;
  Map<String, dynamic> education;
  Map<String, dynamic> skills;
  Map<String, dynamic> languagesLVL;
  String additionalData;

  CVData.fromMap(Map<String, dynamic> map){
    if (map.containsKey('jobExperience') && map['jobExperience'] != null){
      jobExperience = Map.from(map['jobExperience']);
    }
    if (map.containsKey('education') && map['education'] != null){
      jobExperience = Map.from(map['education']);
    }
    if (map.containsKey('skills') && map['skills'] != null){
      jobExperience = Map.from(map['skills']);
    }
    if (map.containsKey('languagesLVL') && map['languagesLVL'] != null){
      jobExperience = Map.from(map['languagesLVL']);
    }
    if (map.containsKey('additionalData') && map['additionalData'] != null){
      jobExperience = Map.from(map['additionalData']);
    }
  }

  Map<String, dynamic> asMap() => {
    'jobExperience': jobExperience,
    'education': education,
    'skills': skills,
    'languagesLVL': languagesLVL,
    'additionalData': additionalData,
  };
}