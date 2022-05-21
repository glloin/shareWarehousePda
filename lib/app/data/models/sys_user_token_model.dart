class SysUserToken {
  String? avatar;
  int? id;
  String? code;
  String? pwd;
  String? name;
  List<Rights>? rights;
  String? groupName;
  String? groupCode;
  String? token;
  int? groupId;

  SysUserToken(
      {this.avatar,
      this.id,
      this.code,
      this.pwd,
      this.name,
      this.rights,
      this.groupName,
      this.groupCode,
      this.token,
      this.groupId});

  SysUserToken.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    id = json['id'];
    code = json['code'];
    pwd = json['pwd'];
    name = json['name'];
    if (json['rights'] != null) {
      rights = <Rights>[];
      json['rights'].forEach((v) {
        rights?.add(Rights.fromJson(v));
      });
    }
    groupName = json['groupName'];
    groupCode = json['groupCode'];
    token = json['token'];
    groupId = json['groupId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['id'] = id;
    data['code'] = code;
    data['pwd'] = pwd;
    data['name'] = name;
    if (rights != null) {
      data['rights'] = rights?.map((v) => v.toJson()).toList();
    }
    data['groupName'] = groupName;
    data['groupCode'] = groupCode;
    data['token'] = token;
    data['groupId'] = groupId;
    return data;
  }
}

class Rights {
  String? name;
  int? right;
  int? sysUserGroupId;

  Rights({this.name, this.right, this.sysUserGroupId});

  Rights.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    right = json['right'];
    sysUserGroupId = json['sysUserGroupId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['right'] = right;
    data['sysUserGroupId'] = sysUserGroupId;
    return data;
  }
}
