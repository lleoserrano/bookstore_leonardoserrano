import '../repositories/database_repository.dart';
import 'database_service.dart';

class DatabaseServiceImpl implements DatabaseService {
  final DatabaseRepository _databaseRepository;

  DatabaseServiceImpl({
    required DatabaseRepository databaseRepository,
  }) : _databaseRepository = databaseRepository;

  @override
  Future<void> deleteUserById() => _databaseRepository.deleteUserById();

  @override
  Future<void> save(String id) => _databaseRepository.save(id);

  @override
  Future<bool> checkContainId(String id) =>
      _databaseRepository.checkContainId(id);

  @override
  Future<void> updateListFav(String id) =>
      _databaseRepository.updateListFav(id);
}
