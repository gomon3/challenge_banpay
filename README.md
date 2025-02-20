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
   ```
2. Entra en el directorio del proyecto:
   ```bash
   cd tu_repositorio
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la aplicación:
   ```bash
   flutter run --flavor dev
   ```
   Para producción:
   ```bash
   flutter run --flavor prod
   ```

## ✅ Pruebas

Ejecuta las pruebas unitarias y de UI con el siguiente comando:
```bash
flutter test
```

## 📌 Mejoras Futuras

Si este proyecto se expandiera a un producto real, se podrían implementar las siguientes mejoras:

1. **Cacheo de datos**: Mejorar la experiencia del usuario almacenando respuestas de la API.
2. **Optimización de UI**: Uso de animaciones más complejas y microinteracciones.
3. **Pruebas End-to-End**: Implementación de tests automatizados con `integration_test`.
4. **Soporte offline**: Permitir visualizar datos previamente cargados sin conexión.
5. **Internacionalización**: Agregar soporte para múltiples idiomas.

### ⏳ Tiempo estimado para mejoras
- **Cacheo de datos**: 2 días
- **Optimización de UI**: 3 días
- **Pruebas End-to-End**: 4 días
- **Soporte offline**: 5 días
- **Internacionalización**: 3 días

## 📄 Licencia
Este proyecto se distribuye bajo la licencia MIT.

---

📢 **Sube este repositorio a GitHub, GitLab o Bitbucket y comparte el enlace.**

