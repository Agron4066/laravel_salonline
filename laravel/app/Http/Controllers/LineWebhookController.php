<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class LineWebhookController extends Controller
{
    public function handle(Request $request)
    {
        // LINEからのリクエストボディを取得
        $body = $request->getContent();

        // ログにリクエストボディを記録
        Log::info('LINE Webhook Request:', ['body' => $body]);

        // リクエストをJSONとしてパース
        $events = json_decode($body, true);

        // イベントごとに処理
        foreach ($events['events'] as $event) {
            // ここにスタンプイベントの処理などを記述
            // 例: $event['type'] === 'message' && $event['message']['type'] === 'sticker'
        }

        return response('OK', 200);
    }
}
