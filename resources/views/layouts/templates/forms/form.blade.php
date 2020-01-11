<?php
    $formMethod     = ( isset( $formMethod ) ) ? $formMethod : 'get' ;
    $formUrl        = ( isset( $formUrl ) ) ? $formUrl : '#' ;

    $formAttr        = ( isset( $formAttr ) ) ? $formAttr : '' ;

    $formAttr        .= ( isset( $blank ) ) ? 'target="_blank"' : '' ;

    $content      = ( isset( $content ) ) ? $content : '' ;
?>
 @if ($errors->any())
    <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}
                <br>
            @endforeach
    </div>
@endif
<form action="<?= $formUrl ?>" method="<?= strtoupper( $formMethod ) ?>"  >
    @csrf
    <?= $content ?>
    <br>
    <button class="btn btn-bold btn-success btn-sm " style="margin-left: 5px;" type="submit">
        Simpan
    </button>
</form>
