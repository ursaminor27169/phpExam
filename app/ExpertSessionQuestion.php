<?php


namespace App;


use Illuminate\Database\Eloquent\Model;

class ExpertSessionQuestion extends Model
{
    protected $table = 'expert_session_questions';
    public $fillable = ['title', 'type', 'options', 'expert_session_id'];
    protected $guarded = [];
    public $timestamps = false;

    public function ExpertSession()
    {
        return $this->belongsTo('App\ExpertSession');
    }
}