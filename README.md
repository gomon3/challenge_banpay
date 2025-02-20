# Challenge Mobile Lead - Flutter

Este proyecto es parte de una prueba técnica para evaluar habilidades en Flutter, incluyendo arquitectura, manejo de estado, consumo de API, persistencia de datos y pruebas.

## 🚀 Características

### Funcionalidades Principales
1. **Consumo de la PokeAPI**:
   - Vista de Listado: Muestra una lista paginada de Pokémon y permite buscar por nombre.
   - Vista de Detalle: Muestra información detallada de un Pokémon, incluyendo estadísticas, habilidades y otros datos relevantes.
   - Opción de "favoritos" para guardar Pokémon seleccionados localmente.
2. **CRUD Local**:
   - Implementación de almacenamiento local utilizando [SQLite/Hive] para gestionar los favoritos.
3. **Filtros Avanzados**:
   - Permite filtrar Pokémon en la vista de listado por características específicas.

## 🛠️ Tecnologías y Librerías Utilizadas

- **Flutter**: Framework principal.
- **Dio**: Para el consumo de la API.
- **Riverpod**: Para el manejo de estado.
- **SQLite / Hive**: Para la persistencia local de favoritos.
- **GoRouter**: Para la navegación.
- **Flutter Test**: Para pruebas unitarias y de UI.

## 🌍 Flavors

Este proyecto cuenta con dos flavors:
- **dev**: Para entornos de desarrollo.
- **prod**: Para entornos de producción.

### 🔐 SSL Pinning
Si se compila en `prod`, se activará el **SSL Pinning** con Dio para mejorar la seguridad de las peticiones. En `dev`, esta funcionalidad estará desactivada para facilitar las pruebas y el desarrollo.

### 🔎 Búsqueda con Elasticsearch
Si deseas probar la búsqueda con **Elasticsearch**, debes compilar el proyecto en `prod` e indicar la dirección IP del servidor en la configuración.

## 📦 Instalación y Ejecución

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu_usuario/tu_repositorio.git
