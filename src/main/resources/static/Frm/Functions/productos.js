document.addEventListener("DOMContentLoaded", function () {
    fetchClientes();

    function fetchClientes() {
        fetch('/api/clientes/listcliente')
            .then(response => response.json())
            .then(data => {
                const tbody = document.getElementById('clientesBody');
                tbody.innerHTML = '';
                data.forEach(cliente => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                                <td>${cliente.cliente_id}</td>
                                <td>${cliente.usuario_id}</td>
                                <td>${cliente.nombre}</td>
                                <td>${cliente.apellido}</td>
                                <td>${cliente.fecha_nac}</td>
                                <td>${cliente.dni}</td>
                                <td>${cliente.ruc}</td>
                                <td>${cliente.correo}</td>
                                <td>${cliente.telefono}</td>
                                <td>${cliente.direccion}</td>
                                <td>
                                    <button onclick="editarCliente(${cliente.cliente_id})" class="edit-btn">Editar</button>
                                    <button onclick="eliminarCliente(${cliente.cliente_id})" class="delete-btn">Eliminar</button>
                                </td>
                            `;
                    tbody.appendChild(row);
                });

                $('#clientesTable').DataTable({
                    "paging": true,
                    "searching": true,
                    "ordering": true,
                    "lengthMenu": [10, 25, 50],
                    "language": {
                        "lengthMenu": "Mostrar _MENU_ registros por página",
                        "zeroRecords": "No se encontraron resultados",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                        "infoEmpty": "No hay registros disponibles",
                        "search": "Buscar:",
                        "paginate": {
                            "previous": "Anterior",
                            "next": "Siguiente"
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching clients:', error));
    }

    document.getElementById('openFormButton').onclick = function () {
        document.getElementById('formModal').style.display = 'flex';
    };

    document.getElementById('closeFormButton').onclick = function () {
        document.getElementById('formModal').style.display = 'none';
    };

    document.getElementById('registerForm').onsubmit = function (event) {
        event.preventDefault();
        let cliente = {
            cliente_id: Date.now(),
            nombre: document.getElementById('nombre').value,
            apellido: document.getElementById('apellido').value,
            fecha_nac: document.getElementById('fecha_nac').value,
            dni: document.getElementById('dni').value,
            ruc: document.getElementById('ruc').value,
            correo: document.getElementById('correo').value,
            telefono: document.getElementById('telefono').value,
            direccion: document.getElementById('direccion').value,
        };

        fetch('/api/clientes/agregacliente', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(cliente)
        })
            .then(response => response.json())
            .then(data => {
                alert('Cliente registrado correctamente');
                fetchClientes();
                document.getElementById('formModal').style.display = 'none';
            })
            .catch(error => console.error('Error registering client:', error));
    };
});

function exportToPDF() {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();
    const table = document.getElementById('clientesTable');
    doc.autoTable({ html: table });
    doc.save('clientes.pdf');
}

function exportToExcel() {
    const table = document.getElementById('clientesTable');
    const wb = XLSX.utils.table_to_book(table, { sheet: 'Clientes' });
    XLSX.writeFile(wb, 'clientes.xlsx');
}