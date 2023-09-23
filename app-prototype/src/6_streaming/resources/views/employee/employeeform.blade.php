@extends('layouts.app')

@section('title')
Data Employee 
@endsection

@section('content')
<div class="container">
  <script>
    function button_cancel() {
      location.replace("{{ asset('/') }}employee");
    }
  </script>
  <div class="card">
    <h5 class="card-header bg-header-card"> Data Pegawai</h5>
    <div class="card-body bg-body-card">
      @if($action == 'insert')
      <form class="form-horizontal" action="{{ asset('/') }}employee" method="post">

        <div class="mb-3 row">
          <label for="nik" class="col-sm-2 col-form-label fw-bold">NIK</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="nik" value="">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="nama" class="col-sm-2 col-form-label fw-bold">Nama</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="nama" value="">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="alamat" class="col-sm-2 col-form-label fw-bold">Alamat</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="alamat" value="">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="email" class="col-sm-2 col-form-label fw-bold">Email</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="email" value="">
          </div>
        </div>
        <div class="mb-3">
          <div class="offset-sm-2 col-sm-10">
            <input type="hidden" name="action" value="{{ $action }}">
            <button type="submit" class="btn btn-primary">Insert</button>
            <button type="button" class="btn btn-secondary" onclick="button_cancel()">Cancel</button>
          </div>
        </div>
        {{ csrf_field() }}
      </form>
      @elseif($action == 'update')
      <form class="form-horizontal" action="{{ asset('/') }}employee/{{ $row->id }}" method="post">
        <div class="mb-3 row">
          <label for="nik" class="col-sm-2 col-form-label fw-bold">NIK</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="nik" value="{{ $row->nik }}">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="nama" class="col-sm-2 col-form-label fw-bold">Nama</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="nama" value="{{ $row->nama }}">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="alamat" class="col-sm-2 col-form-label fw-bold">Alamat</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="alamat" value="{{ $row->alamat }}">
          </div>
        </div>
        <div class="mb-3 row">
          <label for="email" class="col-sm-2 col-form-label fw-bold">Email</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="email" value="{{ $row->email }}">
          </div>
        </div>
        <div class="mb-3 row">
          <div class="offset-sm-2 col-sm-10">
            @method("PATCH")
            <input type="hidden" name="action" value="{{ $action }}">
            <input type="hidden" name="id" value="{{ $row->id }}">
            <button type="submit" class="btn btn-warning">Update</button>
            <button type="button" class="btn btn-secondary" onclick="button_cancel()">Cancel</button>
          </div>
        </div>
        {{ csrf_field() }}
      </form>
      @elseif($action == 'delete')
      <form class="form-horizontal" action="{{ asset('/') }}employee/{{ $row->id }}" method="post">
        <div class="mb-3 row">
          <label for="nik" class="col-sm-2 control-label fw-bold">NIK</label>
          <div class="col-sm-10 bg-alt">
            {{ $row->nik }}
          </div>
        </div>
        <div class="mb-3 row">
          <label for="nama" class="col-sm-2 control-label fw-bold">Nama</label>
          <div class="col-sm-10 bg-alt">
            {{ $row->nama }}
          </div>
        </div>
        <div class="mb-3 row">
          <label for="alamat" class="col-sm-2 control-label fw-bold">Alamat</label>
          <div class="col-sm-10 bg-alt">
            {{ $row->alamat }}
          </div>
        </div>
        <div class="mb-3 row">
          <label for="email" class="col-sm-2 control-label fw-bold">Email</label>
          <div class="col-sm-10 bg-alt">
            {{ $row->email }}
          </div>
        </div>
        <div class="mb-3 row">
          <div class="offset-sm-2 col-sm-10">
            @method("DELETE")
            <input type="hidden" name="action" value="{{ $action }}">
            <input type="hidden" name="id" value="{{ $row->id }}">
            <button type="submit" class="btn btn-danger">Delete</button>
            <button type="button" class="btn btn-secondary" onclick="button_cancel()">Cancel</button>
          </div>
        </div>
        {{ csrf_field() }}
      </form>
      @elseif($action == 'detail')
      <div class="mb-3 row">
        <label for="nik" class="col-sm-2 control-label fw-bold">NIK</label>
        <div class="col-sm-10 bg-alt">
          {{ $row->nik }}
        </div>
      </div>
      <div class="mb-3 row">
        <label for="nama" class="col-sm-2 control-label fw-bold">Nama</label>
        <div class="col-sm-10 bg-alt">
          {{ $row->nama }}
        </div>
      </div>
      <div class="mb-3 row">
        <label for="alamat" class="col-sm-2 control-label fw-bold">Alamat</label>
        <div class="col-sm-10 bg-alt">
          {{ $row->alamat }}
        </div>
      </div>
      <div class="mb-3 row">
        <label for="email" class="col-sm-2 control-label fw-bold">Email</label>
        <div class="col-sm-10 bg-alt">
          {{ $row->email }}
        </div>
      </div>
      <div class="mb-3 row">
        <div class="offset-sm-2 col-sm-10">
          <button type="button" class="btn btn-secondary" onclick="button_cancel()">Back</button>
        </div>
      </div>
      @endif
    </div>
  </div>
</div>
@endsection