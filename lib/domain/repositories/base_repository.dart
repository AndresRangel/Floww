/// Repositorio base abstracto - Define el contrato para CUALQUIER base de datos
/// Esto permite cambiar de Firebase a Supabase, PostgreSQL, etc. sin tocar la app
abstract class BaseRepository<T> {
  /// Crear un nuevo registro
  Future<T> create(T item);
  
  /// Obtener un registro por ID
  Future<T?> getById(String id);
  
  /// Obtener todos los registros
  Future<List<T>> getAll({
    Map<String, dynamic>? filters,
    String? orderBy,
    bool descending = false,
    int? limit,
  });
  
  /// Stream de todos los registros (real-time)
  Stream<List<T>> watchAll({
    Map<String, dynamic>? filters,
    String? orderBy,
    bool descending = false,
    int? limit,
  });
  
  /// Stream de un registro específico (real-time)
  Stream<T?> watchById(String id);
  
  /// Actualizar un registro
  Future<T> update(String id, Map<String, dynamic> data);
  
  /// Eliminar un registro
  Future<void> delete(String id);
  
  /// Buscar registros
  Future<List<T>> search({
    required String query,
    required List<String> searchFields,
  });
  
  /// Verificar si existe
  Future<bool> exists(String id);
  
  /// Contar registros
  Future<int> count({Map<String, dynamic>? filters});
}