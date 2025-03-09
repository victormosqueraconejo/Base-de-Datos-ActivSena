USE BaseDeDatosMarz9;

-- 1. Insertar 20 registros en GestionEvento
INSERT INTO GestionEvento (Aprobar) VALUES
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente'),
('Aprobado'),
('Pendiente');

-- 2. Insertar 20 registros en Usuario
INSERT INTO Usuario (IdentificacionUsuario, Nombre, Apellido, Correo, Telefono, Contrasena, FechaRegistro) VALUES
('ID001', 'Juan',     'Perez',     'juan.perez@example.com',     '555-0001', 'pass1',  '2023-01-01'),
('ID002', 'Maria',    'Lopez',     'maria.lopez@example.com',    '555-0002', 'pass2',  '2023-01-02'),
('ID003', 'Carlos',   'Gomez',     'carlos.gomez@example.com',   '555-0003', 'pass3',  '2023-01-03'),
('ID004', 'Ana',      'Martinez',  'ana.martinez@example.com',   '555-0004', 'pass4',  '2023-01-04'),
('ID005', 'Luis',     'Rodriguez', 'luis.rodriguez@example.com', '555-0005', 'pass5',  '2023-01-05'),
('ID006', 'Sofia',    'Ramirez',   'sofia.ramirez@example.com',  '555-0006', 'pass6',  '2023-01-06'),
('ID007', 'Miguel',   'Torres',    'miguel.torres@example.com',  '555-0007', 'pass7',  '2023-01-07'),
('ID008', 'Laura',    'Fernandez', 'laura.fernandez@example.com', '555-0008', 'pass8',  '2023-01-08'),
('ID009', 'Diego',    'Sanchez',   'diego.sanchez@example.com',  '555-0009', 'pass9',  '2023-01-09'),
('ID010', 'Elena',    'Diaz',      'elena.diaz@example.com',     '555-0010', 'pass10', '2023-01-10'),
('ID011', 'Jorge',    'Ramirez',   'jorge.ramirez@example.com',  '555-0011', 'pass11', '2023-01-11'),
('ID012', 'Paula',    'Morales',   'paula.morales@example.com',  '555-0012', 'pass12', '2023-01-12'),
('ID013', 'Andres',   'Rojas',     'andres.rojas@example.com',   '555-0013', 'pass13', '2023-01-13'),
('ID014', 'Carla',    'Vargas',    'carla.vargas@example.com',   '555-0014', 'pass14', '2023-01-14'),
('ID015', 'Ricardo',  'Castro',    'ricardo.castro@example.com', '555-0015', 'pass15', '2023-01-15'),
('ID016', 'Marta',    'Suarez',    'marta.suarez@example.com',   '555-0016', 'pass16', '2023-01-16'),
('ID017', 'Esteban',  'Pardo',     'esteban.pardo@example.com',  '555-0017', 'pass17', '2023-01-17'),
('ID018', 'Natalia',  'Ortiz',     'natalia.ortiz@example.com',  '555-0018', 'pass18', '2023-01-18'),
('ID019', 'Hugo',     'Fuentes',   'hugo.fuentes@example.com',   '555-0019', 'pass19', '2023-01-19'),
('ID020', 'Veronica', 'Mendoza',   'veronica.mendoza@example.com','555-0020', 'pass20', '2023-01-20');

-- 3. Insertar 20 registros en RolUsuario
-- Se asignan roles de forma cíclica: Administrador, Aprendiz, Instructor
INSERT INTO RolUsuario (NombreRol, IdUsuario) VALUES
('Administrador', 1),
('Aprendiz', 2),
('Instructor', 3),
('Administrador', 4),
('Aprendiz', 5),
('Instructor', 6),
('Administrador', 7),
('Aprendiz', 8),
('Instructor', 9),
('Administrador', 10),
('Aprendiz', 11),
('Instructor', 12),
('Administrador', 13),
('Aprendiz', 14),
('Instructor', 15),
('Administrador', 16),
('Aprendiz', 17),
('Instructor', 18),
('Administrador', 19),
('Aprendiz', 20);

-- 4. Insertar 20 registros en AlquilerElementos
-- Cada registro se asocia a un Usuario (IdUsuario 1 a 20)
INSERT INTO AlquilerElementos (NombreElemento, FechaSolicitud, FechaDevolucion, RegistradoPor, Observaciones, IdUsuario) VALUES
('Elemento 1',  '2023-07-01 09:00:00', '2023-07-01 17:00:00', 'Usuario 1',  'Observación 1',  1),
('Elemento 2',  '2023-07-02 09:00:00', '2023-07-02 17:00:00', 'Usuario 2',  'Observación 2',  2),
('Elemento 3',  '2023-07-03 09:00:00', '2023-07-03 17:00:00', 'Usuario 3',  'Observación 3',  3),
('Elemento 4',  '2023-07-04 09:00:00', '2023-07-04 17:00:00', 'Usuario 4',  'Observación 4',  4),
('Elemento 5',  '2023-07-05 09:00:00', '2023-07-05 17:00:00', 'Usuario 5',  'Observación 5',  5),
('Elemento 6',  '2023-07-06 09:00:00', '2023-07-06 17:00:00', 'Usuario 6',  'Observación 6',  6),
('Elemento 7',  '2023-07-07 09:00:00', '2023-07-07 17:00:00', 'Usuario 7',  'Observación 7',  7),
('Elemento 8',  '2023-07-08 09:00:00', '2023-07-08 17:00:00', 'Usuario 8',  'Observación 8',  8),
('Elemento 9',  '2023-07-09 09:00:00', '2023-07-09 17:00:00', 'Usuario 9',  'Observación 9',  9),
('Elemento 10', '2023-07-10 09:00:00', '2023-07-10 17:00:00', 'Usuario 10', 'Observación 10', 10),
('Elemento 11', '2023-07-11 09:00:00', '2023-07-11 17:00:00', 'Usuario 11', 'Observación 11', 11),
('Elemento 12', '2023-07-12 09:00:00', '2023-07-12 17:00:00', 'Usuario 12', 'Observación 12', 12),
('Elemento 13', '2023-07-13 09:00:00', '2023-07-13 17:00:00', 'Usuario 13', 'Observación 13', 13),
('Elemento 14', '2023-07-14 09:00:00', '2023-07-14 17:00:00', 'Usuario 14', 'Observación 14', 14),
('Elemento 15', '2023-07-15 09:00:00', '2023-07-15 17:00:00', 'Usuario 15', 'Observación 15', 15),
('Elemento 16', '2023-07-16 09:00:00', '2023-07-16 17:00:00', 'Usuario 16', 'Observación 16', 16),
('Elemento 17', '2023-07-17 09:00:00', '2023-07-17 17:00:00', 'Usuario 17', 'Observación 17', 17),
('Elemento 18', '2023-07-18 09:00:00', '2023-07-18 17:00:00', 'Usuario 18', 'Observación 18', 18),
('Elemento 19', '2023-07-19 09:00:00', '2023-07-19 17:00:00', 'Usuario 19', 'Observación 19', 19),
('Elemento 20', '2023-07-20 09:00:00', '2023-07-20 17:00:00', 'Usuario 20', 'Observación 20', 20);

-- 5. Insertar 20 registros en PlanificacionEvento
-- Cada registro se asocia a un registro de GestionEvento (IdGestionE de 1 a 20)
INSERT INTO PlanificacionEvento (NombreEvento, FechaEvento, LugarDeEvento, Recursos, IdGestionE) VALUES
('Plan Evento 1',  '2023-08-01 09:00:00', 'Lugar 1',  'Recursos 1',  1),
('Plan Evento 2',  '2023-08-02 09:00:00', 'Lugar 2',  'Recursos 2',  2),
('Plan Evento 3',  '2023-08-03 09:00:00', 'Lugar 3',  'Recursos 3',  3),
('Plan Evento 4',  '2023-08-04 09:00:00', 'Lugar 4',  'Recursos 4',  4),
('Plan Evento 5',  '2023-08-05 09:00:00', 'Lugar 5',  'Recursos 5',  5),
('Plan Evento 6',  '2023-08-06 09:00:00', 'Lugar 6',  'Recursos 6',  6),
('Plan Evento 7',  '2023-08-07 09:00:00', 'Lugar 7',  'Recursos 7',  7),
('Plan Evento 8',  '2023-08-08 09:00:00', 'Lugar 8',  'Recursos 8',  8),
('Plan Evento 9',  '2023-08-09 09:00:00', 'Lugar 9',  'Recursos 9',  9),
('Plan Evento 10', '2023-08-10 09:00:00', 'Lugar 10', 'Recursos 10', 10),
('Plan Evento 11', '2023-08-11 09:00:00', 'Lugar 11', 'Recursos 11', 11),
('Plan Evento 12', '2023-08-12 09:00:00', 'Lugar 12', 'Recursos 12', 12),
('Plan Evento 13', '2023-08-13 09:00:00', 'Lugar 13', 'Recursos 13', 13),
('Plan Evento 14', '2023-08-14 09:00:00', 'Lugar 14', 'Recursos 14', 14),
('Plan Evento 15', '2023-08-15 09:00:00', 'Lugar 15', 'Recursos 15', 15),
('Plan Evento 16', '2023-08-16 09:00:00', 'Lugar 16', 'Recursos 16', 16),
('Plan Evento 17', '2023-08-17 09:00:00', 'Lugar 17', 'Recursos 17', 17),
('Plan Evento 18', '2023-08-18 09:00:00', 'Lugar 18', 'Recursos 18', 18),
('Plan Evento 19', '2023-08-19 09:00:00', 'Lugar 19', 'Recursos 19', 19),
('Plan Evento 20', '2023-08-20 09:00:00', 'Lugar 20', 'Recursos 20', 20);

-- 6. Insertar 20 registros en Evento
-- Cada registro se asocia a un registro de PlanificacionEvento (IdPlanificarE de 1 a 20)
INSERT INTO Evento (NombreEvento, FechaInicio, FechaFin, HoraFin, HoraInicio, UbicacionEvento, IdPlanificarE, DescripcionEvento) VALUES
('Evento 1',  '2023-09-01', '2023-09-01', '17:00:00', '09:00:00', 'Ubicacion 1',  1,  'Descripcion del Evento 1'),
('Evento 2',  '2023-09-02', '2023-09-02', '17:00:00', '09:00:00', 'Ubicacion 2',  2,  'Descripcion del Evento 2'),
('Evento 3',  '2023-09-03', '2023-09-03', '17:00:00', '09:00:00', 'Ubicacion 3',  3,  'Descripcion del Evento 3'),
('Evento 4',  '2023-09-04', '2023-09-04', '17:00:00', '09:00:00', 'Ubicacion 4',  4,  'Descripcion del Evento 4'),
('Evento 5',  '2023-09-05', '2023-09-05', '17:00:00', '09:00:00', 'Ubicacion 5',  5,  'Descripcion del Evento 5'),
('Evento 6',  '2023-09-06', '2023-09-06', '17:00:00', '09:00:00', 'Ubicacion 6',  6,  'Descripcion del Evento 6'),
('Evento 7',  '2023-09-07', '2023-09-07', '17:00:00', '09:00:00', 'Ubicacion 7',  7,  'Descripcion del Evento 7'),
('Evento 8',  '2023-09-08', '2023-09-08', '17:00:00', '09:00:00', 'Ubicacion 8',  8,  'Descripcion del Evento 8'),
('Evento 9',  '2023-09-09', '2023-09-09', '17:00:00', '09:00:00', 'Ubicacion 9',  9,  'Descripcion del Evento 9'),
('Evento 10', '2023-09-10', '2023-09-10', '17:00:00', '09:00:00', 'Ubicacion 10', 10, 'Descripcion del Evento 10'),
('Evento 11', '2023-09-11', '2023-09-11', '17:00:00', '09:00:00', 'Ubicacion 11', 11, 'Descripcion del Evento 11'),
('Evento 12', '2023-09-12', '2023-09-12', '17:00:00', '09:00:00', 'Ubicacion 12', 12, 'Descripcion del Evento 12'),
('Evento 13', '2023-09-13', '2023-09-13', '17:00:00', '09:00:00', 'Ubicacion 13', 13, 'Descripcion del Evento 13'),
('Evento 14', '2023-09-14', '2023-09-14', '17:00:00', '09:00:00', 'Ubicacion 14', 14, 'Descripcion del Evento 14'),
('Evento 15', '2023-09-15', '2023-09-15', '17:00:00', '09:00:00', 'Ubicacion 15', 15, 'Descripcion del Evento 15'),
('Evento 16', '2023-09-16', '2023-09-16', '17:00:00', '09:00:00', 'Ubicacion 16', 16, 'Descripcion del Evento 16'),
('Evento 17', '2023-09-17', '2023-09-17', '17:00:00', '09:00:00', 'Ubicacion 17', 17, 'Descripcion del Evento 17'),
('Evento 18', '2023-09-18', '2023-09-18', '17:00:00', '09:00:00', 'Ubicacion 18', 18, 'Descripcion del Evento 18'),
('Evento 19', '2023-09-19', '2023-09-19', '17:00:00', '09:00:00', 'Ubicacion 19', 19, 'Descripcion del Evento 19'),
('Evento 20', '2023-09-20', '2023-09-20', '17:00:00', '09:00:00', 'Ubicacion 20', 20, 'Descripcion del Evento 20');

-- 7. Insertar 20 registros en Actividad
-- Cada registro se asocia a un Evento (IdEvento de 1 a 20)
INSERT INTO Actividad (NombreActi, FechaInicio, FechaFin, HoraFin, HoraInicio, TipoLudica, Descripcion, IdEvento) VALUES
('Actividad 1',  '2023-09-01', '2023-09-01', '12:00:00', '10:00:00', 'Workshop',  'Actividad detallada 1',  1),
('Actividad 2',  '2023-09-02', '2023-09-02', '12:00:00', '10:00:00', 'Seminario', 'Actividad detallada 2',  2),
('Actividad 3',  '2023-09-03', '2023-09-03', '12:00:00', '10:00:00', 'Taller',    'Actividad detallada 3',  3),
('Actividad 4',  '2023-09-04', '2023-09-04', '12:00:00', '10:00:00', 'Workshop',  'Actividad detallada 4',  4),
('Actividad 5',  '2023-09-05', '2023-09-05', '12:00:00', '10:00:00', 'Seminario', 'Actividad detallada 5',  5),
('Actividad 6',  '2023-09-06', '2023-09-06', '12:00:00', '10:00:00', 'Taller',    'Actividad detallada 6',  6),
('Actividad 7',  '2023-09-07', '2023-09-07', '12:00:00', '10:00:00', 'Workshop',  'Actividad detallada 7',  7),
('Actividad 8',  '2023-09-08', '2023-09-08', '12:00:00', '10:00:00', 'Seminario', 'Actividad detallada 8',  8),
('Actividad 9',  '2023-09-09', '2023-09-09', '12:00:00', '10:00:00', 'Taller',    'Actividad detallada 9',  9),
('Actividad 10', '2023-09-10', '2023-09-10', '12:00:00', '10:00:00', 'Workshop',  'Actividad detallada 10', 10),
('Actividad 11', '2023-09-11', '2023-09-11', '12:00:00', '10:00:00', 'Seminario', 'Actividad detallada 11', 11),
('Actividad 12', '2023-09-12', '2023-09-12', '12:00:00', '10:00:00', 'Taller',    'Actividad detallada 12', 12),
('Actividad 13', '2023-09-13', '2023-09-13', '12:00:00', '10:00:00', 'Workshop',  'Actividad detallada 13', 13),
('Actividad 14', '2023-09-14', '2023-09-14', '12:00:00', '10:00:00', 'Seminario', 'Actividad detallada 14', 14),
('Actividad 15', '2023-09-15', '2023-09-15', '12:00:00', '10:00:00', 'Taller',    'Actividad detallada 15', 15),
('Actividad 16', '2023-09-16', '2023-09-16', '12:00:00', '10:00:00', 'Workshop',  'Actividad detallada 16', 16),
('Actividad 17', '2023-09-17', '2023-09-17', '12:00:00', '10:00:00', 'Seminario', 'Actividad detallada 17', 17),
('Actividad 18', '2023-09-18', '2023-09-18', '12:00:00', '10:00:00', 'Taller',    'Actividad detallada 18', 18),
('Actividad 19', '2023-09-19', '2023-09-19', '12:00:00', '10:00:00', 'Workshop',  'Actividad detallada 19', 19),
('Actividad 20', '2023-09-20', '2023-09-20', '12:00:00', '10:00:00', 'Seminario', 'Actividad detallada 20', 20);

-- 8. Insertar 20 registros en Asistencia
-- Cada registro se asocia a un Usuario (IdUsuario) y a una Actividad (IdActividad)
INSERT INTO Asistencia (AsiFecha, AsiHorasAsistidas, QREntrada, QRSalida, IdUsuario, IdActividad) VALUES
('2023-09-02 10:00:00', 2, 'QR_ENTRADA1',  'QR_SALIDA1',  1,  1),
('2023-09-03 10:00:00', 2, 'QR_ENTRADA2',  'QR_SALIDA2',  2,  2),
('2023-09-04 10:00:00', 2, 'QR_ENTRADA3',  'QR_SALIDA3',  3,  3),
('2023-09-05 10:00:00', 2, 'QR_ENTRADA4',  'QR_SALIDA4',  4,  4),
('2023-09-06 10:00:00', 2, 'QR_ENTRADA5',  'QR_SALIDA5',  5,  5),
('2023-09-07 10:00:00', 2, 'QR_ENTRADA6',  'QR_SALIDA6',  6,  6),
('2023-09-08 10:00:00', 2, 'QR_ENTRADA7',  'QR_SALIDA7',  7,  7),
('2023-09-09 10:00:00', 2, 'QR_ENTRADA8',  'QR_SALIDA8',  8,  8),
('2023-09-10 10:00:00', 2, 'QR_ENTRADA9',  'QR_SALIDA9',  9,  9),
('2023-09-11 10:00:00', 2, 'QR_ENTRADA10', 'QR_SALIDA10', 10, 10),
('2023-09-12 10:00:00', 2, 'QR_ENTRADA11', 'QR_SALIDA11', 11, 11),
('2023-09-13 10:00:00', 2, 'QR_ENTRADA12', 'QR_SALIDA12', 12, 12),
('2023-09-14 10:00:00', 2, 'QR_ENTRADA13', 'QR_SALIDA13', 13, 13),
('2023-09-15 10:00:00', 2, 'QR_ENTRADA14', 'QR_SALIDA14', 14, 14),
('2023-09-16 10:00:00', 2, 'QR_ENTRADA15', 'QR_SALIDA15', 15, 15),
('2023-09-17 10:00:00', 2, 'QR_ENTRADA16', 'QR_SALIDA16', 16, 16),
('2023-09-18 10:00:00', 2, 'QR_ENTRADA17', 'QR_SALIDA17', 17, 17),
('2023-09-19 10:00:00', 2, 'QR_ENTRADA18', 'QR_SALIDA18', 18, 18),
('2023-09-20 10:00:00', 2, 'QR_ENTRADA19', 'QR_SALIDA19', 19, 19),
('2023-09-21 10:00:00', 2, 'QR_ENTRADA20', 'QR_SALIDA20', 20, 20),
('2023-09-21 10:00:00', 2, 'QR_ENTRADA21', 'QR_SALIDA21', 10, 20);

-- 9. Insertar 20 registros en Constancia
-- Cada registro se asocia a un Usuario (IdUsuario)
INSERT INTO Constancia (ConstanciaHorasCert, ConstanciaEstado, ConstanciaFecha, IdUsuario) VALUES
(2, 'Aprobado', '2023-09-03 15:00:00',  1),
(3, 'Pendiente', '2023-09-04 15:00:00',  2),
(2, 'Aprobado', '2023-09-05 15:00:00',  3),
(3, 'Pendiente', '2023-09-06 15:00:00',  4),
(2, 'Aprobado', '2023-09-07 15:00:00',  5),
(3, 'Pendiente', '2023-09-08 15:00:00',  6),
(2, 'Aprobado', '2023-09-09 15:00:00',  7),
(3, 'Pendiente', '2023-09-10 15:00:00',  8),
(2, 'Aprobado', '2023-09-11 15:00:00',  9),
(3, 'Pendiente', '2023-09-12 15:00:00', 10),
(2, 'Aprobado', '2023-09-13 15:00:00', 11),
(3, 'Pendiente', '2023-09-14 15:00:00', 12),
(2, 'Aprobado', '2023-09-15 15:00:00', 13),
(3, 'Pendiente', '2023-09-16 15:00:00', 14),
(2, 'Aprobado', '2023-09-17 15:00:00', 15),
(3, 'Pendiente', '2023-09-18 15:00:00', 16),
(2, 'Aprobado', '2023-09-19 15:00:00', 17),
(3, 'Pendiente', '2023-09-20 15:00:00', 18),
(2, 'Aprobado', '2023-09-21 15:00:00', 19),
(3, 'Pendiente', '2023-09-22 15:00:00', 20);

-- 10. Insertar 20 registros en ConsultaIA
-- Cada registro se asocia a un Usuario (IdUsuario)
INSERT INTO ConsultaIA (Pregunta, Respuesta, Fecha, Descripcion, IdUsuario) VALUES
('Pregunta IA 1',  'Respuesta IA 1', '2023-09-04', 'Descripcion consulta IA 1',  1),
('Pregunta IA 2',  'Respuesta IA 2', '2023-09-05', 'Descripcion consulta IA 2',  2),
('Pregunta IA 3',  'Respuesta IA 3', '2023-09-06', 'Descripcion consulta IA 3',  3),
('Pregunta IA 4',  'Respuesta IA 4', '2023-09-07', 'Descripcion consulta IA 4',  4),
('Pregunta IA 5',  'Respuesta IA 5', '2023-09-08', 'Descripcion consulta IA 5',  5),
('Pregunta IA 6',  'Respuesta IA 6', '2023-09-09', 'Descripcion consulta IA 6',  6),
('Pregunta IA 7',  'Respuesta IA 7', '2023-09-10', 'Descripcion consulta IA 7',  7),
('Pregunta IA 8',  'Respuesta IA 8', '2023-09-11', 'Descripcion consulta IA 8',  8),
('Pregunta IA 9',  'Respuesta IA 9', '2023-09-12', 'Descripcion consulta IA 9',  9),
('Pregunta IA 10', 'Respuesta IA 10','2023-09-13', 'Descripcion consulta IA 10', 10),
('Pregunta IA 11', 'Respuesta IA 11','2023-09-14', 'Descripcion consulta IA 11', 11),
('Pregunta IA 12', 'Respuesta IA 12','2023-09-15', 'Descripcion consulta IA 12', 12),
('Pregunta IA 13', 'Respuesta IA 13','2023-09-16', 'Descripcion consulta IA 13', 13),
('Pregunta IA 14', 'Respuesta IA 14','2023-09-17', 'Descripcion consulta IA 14', 14),
('Pregunta IA 15', 'Respuesta IA 15','2023-09-18', 'Descripcion consulta IA 15', 15),
('Pregunta IA 16', 'Respuesta IA 16','2023-09-19', 'Descripcion consulta IA 16', 16),
('Pregunta IA 17', 'Respuesta IA 17','2023-09-20', 'Descripcion consulta IA 17', 17),
('Pregunta IA 18', 'Respuesta IA 18','2023-09-21', 'Descripcion consulta IA 18', 18),
('Pregunta IA 19', 'Respuesta IA 19','2023-09-22', 'Descripcion consulta IA 19', 19),
('Pregunta IA 20', 'Respuesta IA 20','2023-09-23', 'Descripcion consulta IA 20', 20);

-- 11. Insertar 20 registros en Notificaciones
-- Cada registro se asocia a un Evento (IdEvento) y se asigna un Tipo cíclico entre 'Evento', 'Actividad', 'Anuncio'
INSERT INTO Notificaciones (Mensaje, TiposNotificacion, FechaDeEnvio, IdEvento) VALUES
('Notificación 1',  'Evento',     '2023-09-05',  1),
('Notificación 2',  'Actividad',  '2023-09-06',  2),
('Notificación 3',  'Anuncio',    '2023-09-07',  3),
('Notificación 4',  'Evento',     '2023-09-08',  4),
('Notificación 5',  'Actividad',  '2023-09-09',  5),
('Notificación 6',  'Anuncio',    '2023-09-10',  6),
('Notificación 7',  'Evento',     '2023-09-11',  7),
('Notificación 8',  'Actividad',  '2023-09-12',  8),
('Notificación 9',  'Anuncio',    '2023-09-13',  9),
('Notificación 10', 'Evento',     '2023-09-14', 10),
('Notificación 11', 'Actividad',  '2023-09-15', 11),
('Notificación 12', 'Anuncio',    '2023-09-16', 12),
('Notificación 13', 'Evento',     '2023-09-17', 13),
('Notificación 14', 'Actividad',  '2023-09-18', 14),
('Notificación 15', 'Anuncio',    '2023-09-19', 15),
('Notificación 16', 'Evento',     '2023-09-20', 16),
('Notificación 17', 'Actividad',  '2023-09-21', 17),
('Notificación 18', 'Anuncio',    '2023-09-22', 18),
('Notificación 19', 'Evento',     '2023-09-23', 19),
('Notificación 20', 'Actividad',  '2023-09-24', 20);

-- 12. Insertar 20 registros en Feedback
INSERT INTO Feedback (ComentarioFeedback, FechaEnvio) VALUES
('Feedback comentario 1',  '2023-09-06 10:00:00'),
('Feedback comentario 2',  '2023-09-07 10:00:00'),
('Feedback comentario 3',  '2023-09-08 10:00:00'),
('Feedback comentario 4',  '2023-09-09 10:00:00'),
('Feedback comentario 5',  '2023-09-10 10:00:00'),
('Feedback comentario 6',  '2023-09-11 10:00:00'),
('Feedback comentario 7',  '2023-09-12 10:00:00'),
('Feedback comentario 8',  '2023-09-13 10:00:00'),
('Feedback comentario 9',  '2023-09-14 10:00:00'),
('Feedback comentario 10', '2023-09-15 10:00:00'),
('Feedback comentario 11', '2023-09-16 10:00:00'),
('Feedback comentario 12', '2023-09-17 10:00:00'),
('Feedback comentario 13', '2023-09-18 10:00:00'),
('Feedback comentario 14', '2023-09-19 10:00:00'),
('Feedback comentario 15', '2023-09-20 10:00:00'),
('Feedback comentario 16', '2023-09-21 10:00:00'),
('Feedback comentario 17', '2023-09-22 10:00:00'),
('Feedback comentario 18', '2023-09-23 10:00:00'),
('Feedback comentario 19', '2023-09-24 10:00:00'),
('Feedback comentario 20', '2023-09-25 10:00:00');

-- 13. Insertar 20 registros en RelUsuarioFeedback
-- Cada registro relaciona un Usuario (IdUsuario) con un Feedback (IdFeedback)
INSERT INTO RelUsuarioFeedback (IdUsuario, IdFeedback, FechaRelUsuaFeed) VALUES
(1,  1,  '2023-09-07'),
(2,  2,  '2023-09-08'),
(3,  3,  '2023-09-09'),
(4,  4,  '2023-09-10'),
(5,  5,  '2023-09-11'),
(6,  6,  '2023-09-12'),
(7,  7,  '2023-09-13'),
(8,  8,  '2023-09-14'),
(9,  9,  '2023-09-15'),
(10, 10,  '2023-09-16'),
(11, 11,  '2023-09-17'),
(12, 12,  '2023-09-18'),
(13, 13,  '2023-09-19'),
(14, 14,  '2023-09-20'),
(15, 15,  '2023-09-21'),
(16, 16,  '2023-09-22'),
(17, 17,  '2023-09-23'),
(18, 18,  '2023-09-24'),
(19, 19,  '2023-09-25'),
(20, 20,  '2023-09-26');

-- 14. Insertar 20 registros en RelUsuarioEvento
-- Cada registro relaciona un Usuario (IdUsuario) con un Evento (IdEvento)
INSERT INTO RelUsuarioEvento (IdUsuario, IdEvento) VALUES
(1,  1),
(2,  2),
(3,  3),
(4,  4),
(5,  5),
(6,  6),
(7,  7),
(8,  8),
(9,  9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);
