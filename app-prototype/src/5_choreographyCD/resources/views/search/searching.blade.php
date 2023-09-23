@extends('layouts.app')

@section('content')
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header bg-dark text-white"><strong>Cari Berita</strong></div>
        <div class="card-body">
          <form action="{{ asset('/') }}query" method="post">
            <div class="form-group row">
              <div class="col-sm-10">
                <input type="text" class="form-control form-control-md" name="keyword" value="{{ $keyword ?? '' }}">
                {{ csrf_field() }}
              </div>
              <div class="col-sm-2">
                <button type="submit" class="btn btn-primary mb-2"> Cari </button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <br>
      <div class="card">
        <div class="card-header bg-dark text-white"><strong>Hasil Pencarian</strong></div>
        <div class="card-body">
          <div class="row row-cols-1 row-cols-md-4 g-4">
            @if(isset($posts) && count($posts)!=0)
            @foreach ($posts as $post)
            <div class="col">
              <div class="card h-100">
                <img src="{{env('APP_URL').'/images'.'/'.$post->image }}" height="160" class="card-img-top" alt="...">
                <div class="card-body">
                  <a href="{{ asset('/detail/'. $post['id']) }}" class="link-success link-underline-opacity-25">
                    {{$post['title']}} </a>
                  <div>
                    <small> Publikasi : {{ formatTanggal($post['updated_at']) }} </small>
                  </div>
                </div>
              </div>
            </div>
            @endforeach
            @else
            <div class="col">
              Pencarian Tidak Ditemukan
            </div>
            @endif
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection