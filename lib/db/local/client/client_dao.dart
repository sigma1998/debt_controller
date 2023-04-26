import 'package:debt_controller/db/local/client/client_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ClientDao {
  @Query('select * from client')
  Stream<List<ClientData>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(ClientData data);

  // @Insert()
  // insert(ClientData data);
}
//
// @Insert()
// insert(ClientData data);
//
// @Query('delete * from client where id =:data')
// delete(ClientData data);
