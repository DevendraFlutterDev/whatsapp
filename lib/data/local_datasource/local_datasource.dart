import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp/domain/entities/contact_entity.dart';

abstract class LocalDataSource {
  Future<List<ContactEntity>> getDeviceNumbers();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<ContactEntity>> getDeviceNumbers() async {
    List<ContactEntity> contacts = [];
    if (await Permission.contacts.isDenied) {
      await Permission.contacts.request();
    } else if (await Permission.contacts.isPermanentlyDenied) {
      openAppSettings();
    } else if (await Permission.contacts.isGranted) {
      final getContactsData = await ContactsService.getContacts();
      for (var myContact in getContactsData) {
        myContact.phones?.forEach((phoneData) {
          contacts.add(ContactEntity(
            phoneNumber: phoneData.value,
            label: myContact.displayName,
          ));
        });
      }
    }
    return contacts;
  }
}
