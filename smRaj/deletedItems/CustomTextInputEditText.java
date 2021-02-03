package com.bd.smartrajshahi.utility;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.AttributeSet;

import androidx.annotation.NonNull;

import com.bd.smartrajshahi.R;
import com.google.android.material.textfield.TextInputEditText;

public class CustomTextInputEditText extends TextInputEditText {

    private String mPrefix; // can be hardcoded for demo purposes
    private Rect mPrefixRect = new Rect(); // actual prefix size

    public CustomTextInputEditText(@NonNull Context context, AttributeSet attrs) {
        super(context, attrs);
        mPrefix=context.getResources().getString(R.string.country_code);
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        getPaint().getTextBounds(mPrefix, 0, mPrefix.length(), mPrefixRect);
        mPrefixRect.right += getPaint().measureText(" "); // add some offset
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawText(mPrefix, super.getCompoundPaddingLeft(), getBaseline(), getPaint());
    }

    @Override
    public int getCompoundPaddingLeft() {
        return super.getCompoundPaddingLeft() + mPrefixRect.width();
    }
}
