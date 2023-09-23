@extends('layouts.app')

@section('title')
Data Employee 
@endsection

@section('content')
<div class="container">
  <div class="card">
    <h5 class="card-header bg-header-card"> Data Pegawai</h5>
    <div class="card-body bg-body-card">
      <div class="table-responsive">
        <table class="table table-striped table-hover ">
          <thead class="thead-dark">
            <tr>
              <th>No</th>
              <th>NIK</th>
              <th>Nama</th>
              <th>Alamat</th>
              <th>Email</th>
              <th width="150" class="text-center">
                <a class="btn btn-success" href="{{asset('/')}}employee/create">
                  <i class="fas fa-plus"></i>
                </a>
              </th>
            </tr>
          </thead>
          <tbody>
            @php ($no = 1)
            @foreach ($rows as $row)
            <tr>
              <td>{{ $no++ }}.</td>
              <td>{{ $row['nik'] }}</td>
              <td>{{ $row['nama'] }}</td>
              <td>{{ $row['alamat'] }}</td>
              <td>{{ $row['email'] }}</td>
              <td align="center">
                <a class="btn btn-secondary" href="{{asset('/')}}employee/{{ $row->id }}">
                  <i class="fas fa-info-circle"></i></a>
                <a class="btn btn-warning" href="{{asset('/')}}employee/{{ $row->id }}/edit">
                  <i class="far fa-edit">
                  </i></a>
                <a class="btn btn-danger" href="{{asset('/')}}employee/{{ $row->id }}/delete">
                  <i class="far fa-trash-alt"></i></a>
              </td>
            </tr>
            @endforeach
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
@endsection