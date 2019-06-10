
part of 'domain.dart';

Domain _$DomainFromJson(Map<String, dynamic> json){
  return Domain(
    json['DomainName'] as String,
    json['Attrs'] == null
        ? null
        // to List<Attr> []
        : Attrs.fromJson(json['Attrs']),
    json['Actions'] == null
        ? null
        : Actions.fromJson(json['Actions'])
        // to List<Action>
        // : json['Actions'].map(
        //   (e) => e == null ? null : Action.fromJson(e)
        // ).toList()
  );
}

Map<String, dynamic> _$DomainToJson(Domain instance) {
  return {
    'DomainName': instance.domainName,
    'Attrs': instance.attrs?.toJson(),
    'Actions': instance.actions?.toJson()
  };
}