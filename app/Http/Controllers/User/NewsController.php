<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UadminController;

use Session;
use App\User;
use App\Alert;
use App\Model\News;
use Auth;



class NewsController extends UadminController
{
    public function __construct()
    {
        parent::__construct();
        $this->data[ 'menu_id' ] = "news";
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table[ 'header' ]  = [ 
            'title' => 'Judul',
            'image' => 'Gambar',
            'preview' => 'Preview',
        ];
        $table[ 'number' ]  = 1;
        $table[ 'rows' ]    = News::get();
        $table[ 'action' ]  = [
            "link" => [
                "dataParam"     => "id",
                "linkName"      => "Edit",
                "url"           => url('news'),
                "buttonColor"   => "primary",
            ],//link
            "modal_delete" => [
                "modalId"       => "delete",
                "dataParam"     => "id",
                "modalTitle"    => "Hapus",
                "formUrl"       => url('news'),
                "formMethod"    => "post",
                "buttonColor"   => "danger",
                "formFields"    => [
                    '_method' => [
                        'type' => 'hidden',
                        'value'=> 'DELETE'
                    ],
                    'id' => [
                        'type' => 'hidden',
                    ],
                ],
            ],//modal_delete
        ];
        $table[ 'imageUrl' ]    = News::PHOTO_PATH."/";
        $table = view('news.table', $table);
        $this->data[ 'contents' ]            = $table;

        $linkCreate['url']              = route('news.create');
        $linkCreate['linkName']         = 'Buat Berita';
        $linkCreate                     = view('layouts.templates.tables.actions.link', $linkCreate);
        $this->data[ 'header_button' ]  = $linkCreate;

        $this->data[ 'page_title' ]          = 'Berita';
        $this->data[ 'header' ]              = 'Daftar Berita';
        return $this->render(  );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $form[ 'formUrl' ]      = route('news.store');
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $form[ 'formEnctype' ]  = 'multipart';
        $formFields = News::getFormData(  );
        
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields ] );
        $form                   = view('layouts.templates.forms.form', $form );
        
        $this->data[ 'contents' ]            = $form ;

        $this->data[ 'message_alert' ]       = Session::get('message');

        $this->data[ 'page_title' ]          = 'Berita';
        $this->data[ 'header' ]              = 'Buat Berita';
        return $this->render(  );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate( [
            'image' => 'required|file|max:1024',
            'title' => 'required',
            'preview' => 'required',
            'file_content' => 'required',
        ] );
        
        // echo $request->input('file_content');
        // die;
        $fileName = "NEWS_".time().".".$request->image->getClientOriginalExtension();
        $request->image->move( News::PHOTO_PATH, $fileName );
        News::create([
            'image'         => $fileName ,
            'title'         => $request->input('title') ,
            'preview'       => $request->input('preview') ,
            'file_content'  => $request->input('file_content') ,
        ]);

        return redirect()->route('news.index')->with(['message' => Alert::setAlert( 1, "data berhasil di buat" ) ]);

    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $news       = News::findOrFail( $id );

        $form[ 'formUrl' ]      = route('news.update', $id);
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $form[ 'formEnctype' ]  = 'multipart';
        $formFields = News::getFormData(  );
        $formFields["_method"] = [
            'type' => 'hidden',
            'value' => "PUT"
        ];
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields, 'data'=> $news ] );
        $form                   = view('layouts.templates.forms.form', $form );
        
        $this->data[ 'contents' ]            = $form ;

        $this->data[ 'message_alert' ]       = Session::get('message');

        $this->data[ 'page_title' ]          = 'Berita';
        $this->data[ 'header' ]              = 'Buat Berita';
        return $this->render(  );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate( [
            // 'image' => 'required|file|max:1024',
            'title' => 'required',
            'preview' => 'required',
            'file_content' => 'required',
        ] );
        
        // echo $request->input('file_content');
        // die;
        $news       = News::findOrFail( $id );

        $data['title']          = $request->input('title') ;
        $data['preview']        = $request->input('preview') ;
        $data['file_content']   = $request->input('file_content') ;
        if( isset( $request->image ) )
        {
            $fileName = "NEWS_".time().".".$request->image->getClientOriginalExtension();
            $request->image->move( News::PHOTO_PATH, $fileName );
            $data['image'] = $fileName;

            unlink( News::PHOTO_PATH."/".$news->image );
        }

        $news->update($data);

        return redirect()->route('news.index')->with(['message' => Alert::setAlert( 1, "data berhasil diubah" ) ]);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $news = News::find( $id );
        unlink( News::PHOTO_PATH."/".$news->image );
        $news->delete();
        return redirect()->route('news.index')->with(['message' => Alert::setAlert( 1, "data berhasil di hapus" ) ]);
    }
}
