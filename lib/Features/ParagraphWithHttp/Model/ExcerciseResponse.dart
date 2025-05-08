class ExcerciseResponse {
  ExcerciseResponse({
    required this.message,
    required this.success,
    required this.data,
    required this.status,
  });

  final String? message;
  final bool? success;
  final Data? data;
  final int? status;

  factory ExcerciseResponse.fromJson(Map<String, dynamic> json){
    return ExcerciseResponse(
      message: json["Message"],
      success: json["Success"],
      data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      status: json["Status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Success": success,
    "Data": data?.toJson(),
    "Status": status,
  };

}

class Data {
  Data({
    required this.exerciseId,
    required this.title,
    required this.svgIcon,
    required this.description,
    required this.exerciseIntros,
    required this.exerciseGroups,
  });

  final String? exerciseId;
  final String? title;
  final String? svgIcon;
  final dynamic description;
  final List<ExerciseIntro> exerciseIntros;
  final List<ExerciseGroup> exerciseGroups;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      exerciseId: json["exercise_id"],
      title: json["title"],
      svgIcon: json["svg_icon"],
      description: json["description"],
      exerciseIntros: json["exercise_intros"] == null ? [] : List<ExerciseIntro>.from(json["exercise_intros"]!.map((x) => ExerciseIntro.fromJson(x))),
      exerciseGroups: json["exercise_groups"] == null ? [] : List<ExerciseGroup>.from(json["exercise_groups"]!.map((x) => ExerciseGroup.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "exercise_id": exerciseId,
    "title": title,
    "svg_icon": svgIcon,
    "description": description,
    "exercise_intros": exerciseIntros.map((x) => x?.toJson()).toList(),
    "exercise_groups": exerciseGroups.map((x) => x?.toJson()).toList(),
  };

}

class ExerciseGroup {
  ExerciseGroup({
    required this.exerciseQuestionGroupId,
    required this.title,
    required this.info,
    required this.exerciseQuestions,
  });

  final String? exerciseQuestionGroupId;
  final String? title;
  final String? info;
  final List<Question> exerciseQuestions;

  factory ExerciseGroup.fromJson(Map<String, dynamic> json){
    return ExerciseGroup(
      exerciseQuestionGroupId: json["exercise_question_group_id"],
      title: json["title"],
      info: json["info"],
      exerciseQuestions: json["exercise_questions"] == null ? [] : List<Question>.from(json["exercise_questions"]!.map((x) => Question.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "exercise_question_group_id": exerciseQuestionGroupId,
    "title": title,
    "info": info,
    "exercise_questions": exerciseQuestions.map((x) => x?.toJson()).toList(),
  };

}

class Question {
  Question({
    required this.exerciseQuestionId,
    required this.question,
    required this.description,
    required this.type,
    required this.min,
    required this.max,
    required this.isRequired,
    required this.options,
    required this.subQuestions,
    required this.exerciseSubQuestionId,
  });

  final String? exerciseQuestionId;
  final String? question;
  final String? description;
  final String? type;
  final int? min;
  final int? max;
  final int? isRequired;
  final List<Option> options;
  final List<Question> subQuestions;
  final String? exerciseSubQuestionId;

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      exerciseQuestionId: json["exercise_question_id"],
      question: json["question"],
      description: json["description"],
      type: json["type"],
      min: json["min"],
      max: json["max"],
      isRequired: json["is_required"],
      options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
      subQuestions: json["sub_questions"] == null ? [] : List<Question>.from(json["sub_questions"]!.map((x) => Question.fromJson(x))),
      exerciseSubQuestionId: json["exercise_sub_question_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "exercise_question_id": exerciseQuestionId,
    "question": question,
    "description": description,
    "type": type,
    "min": min,
    "max": max,
    "is_required": isRequired,
    "options": options.map((x) => x?.toJson()).toList(),
    "sub_questions": subQuestions.map((x) => x?.toJson()).toList(),
    "exercise_sub_question_id": exerciseSubQuestionId,
  };

}

class Option {
  Option({
    required this.exerciseQuestionOptionId,
    required this.option,
    required this.isDescription,
  });

  final String? exerciseQuestionOptionId;
  final String? option;
  final int? isDescription;

  factory Option.fromJson(Map<String, dynamic> json){
    return Option(
      exerciseQuestionOptionId: json["exercise_question_option_id"],
      option: json["option"],
      isDescription: json["is_description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "exercise_question_option_id": exerciseQuestionOptionId,
    "option": option,
    "is_description": isDescription,
  };

}

class ExerciseIntro {
  ExerciseIntro({
    required this.exerciseIntroId,
    required this.title,
    required this.type,
    required this.description,
    required this.imageUrl,
  });

  final String? exerciseIntroId;
  final String? title;
  final String? type;
  final String? description;
  final String? imageUrl;

  factory ExerciseIntro.fromJson(Map<String, dynamic> json){
    return ExerciseIntro(
      exerciseIntroId: json["exercise_intro_id"],
      title: json["title"],
      type: json["type"],
      description: json["description"],
      imageUrl: json["image_url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "exercise_intro_id": exerciseIntroId,
    "title": title,
    "type": type,
    "description": description,
    "image_url": imageUrl,
  };

}
