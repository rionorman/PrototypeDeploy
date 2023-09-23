@extends('layouts.app')

@section('title')
Data Category 
@endsection

@section('content')
<div class="container">
  <script>
    function button_cancel() {
      location.replace("{{ asset('/') }}category");
    }
  </script>
  <div class="card">
    <h5 class="card-header bg-header-card"> Data Category</h5>
    <div class="card-body bg-body-card">
      @if($action == 'insert')
      <form class="form-horizontal" action="{{ asset('/') }}category" method="post">
        <div class="mb-3 row">
          <label for="category" class="col-sm-2 col-form-label fw-bold">Category</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="category" value="">
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
      <form class="form-horizontal" action="{{ asset('/') }}category/{{ $row->id }}" method="post">
        <div class="mb-3 row">
          <label for="category" class="col-sm-2 col-form-label fw-bold">Category</label>
          <div class="col-sm-10">
            <input class="form-control" type="text" name="category" value="{{ $row->category }}">
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
      <form class="form-horizontal" action="{{ asset('/') }}category/{{ $row->id }}" method="post">
        <div class="mb-3 row">
          <label for="category" class="col-sm-2 control-label fw-bold">Category</label>
          <div class="col-sm-10 bg-alt">
            {{ $row->category }}
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
        <label for="category" class="col-sm-2 control-label fw-bold">Category</label>
        <div class="col-sm-10 bg-alt">
          {{ $row->category }}
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