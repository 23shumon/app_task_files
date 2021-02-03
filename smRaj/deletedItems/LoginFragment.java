package com.bd.smartrajshahi.userAuth;

import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;

import android.text.Editable;
import android.text.Selection;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;


import com.bd.smartrajshahi.R;
import com.bd.smartrajshahi.utility.ContactValidator;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;

import static com.bd.smartrajshahi.utility.ContactValidator.validate;

public class LoginFragment extends Fragment {


    private Toolbar toolbar;
    private TextView forgotPassTV, regTV;
    private Button loginBtn;
    private TextInputEditText contactET, passwordET;
//    private CustomTextInputEditText contactET, passwordET;
    private TextInputLayout contactTIL, passTIL;
    private Context context;
    private String countryCode;
    private LoginFragmentAction loginFragmentAction;
    private static final String TAG = "LoginFragment ";


    public LoginFragment() {
        // Required empty public constructor
    }

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);
        this.context = context;
        loginFragmentAction = (LoginFragmentAction) context;
        countryCode = context.getResources().getString(R.string.country_code);
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_login, container, false);

//        toolbar=view.findViewById(R.id.top);
        contactET = view.findViewById(R.id.contactET);
        passwordET = view.findViewById(R.id.passwordET);
        loginBtn = view.findViewById(R.id.login_btn);
        regTV = view.findViewById(R.id.regTV);
        forgotPassTV = view.findViewById(R.id.forgotPassTV);
        contactTIL = view.findViewById(R.id.contactTIL);
        passTIL = view.findViewById(R.id.passTIL);
//        ((AppCompatActivity)getActivity()).setSupportActionBar(toolbar);
//        ((AppCompatActivity)getActivity()).getSupportActionBar().setDisplayShowTitleEnabled(false);
//        toolbar.setTitle("");
//        toolbar.setTitleTextColor(0xFFFFFFFF);

        regTV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                ((AuthCompleteListener)context).onAuthComplete();
                loginFragmentAction.onSignUpClicked();
            }
        });

        contactET.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View view, boolean b) {
//                setCode();
            }
        });



        loginBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String contact = contactET.getText().toString();
                String password = passwordET.getText().toString();

                validateData(contact, password);
            }
        });

        return view;
    }

    private void validateData(String contact, String password) {
        if (contact.isEmpty()) {
            contactET.setError(context.getResources().getString(R.string.empty_contact_err));
        } else {
            String tmp_contact = contact.substring(4);
            if (tmp_contact.length() < 11) {
                contactTIL.setError(context.getResources().getString(R.string.contact_length_err));
            } else {
                ContactValidator validator = validate(tmp_contact);
                String msg = validator.getMsg();
                Log.d(TAG, "onClick: " + msg + "  " + validator.isValid);

                if (!validator.isValid) {
                    contactTIL.setError(context.getResources().getString(R.string.invalid_contact_err));
                } else {
                    contactTIL.setError(null);
                    if (password.isEmpty() || password.length() < 8) {
                        passTIL.setError(context.getResources().getString(R.string.invalid_pwd_err));
                    } else {
                        passTIL.setError(null);
                        doLogin(tmp_contact, password);
                    }
                }
            }
        }
    }

    private void doLogin(String contact, String password) {
    }

    private void setCode() {
        contactET.setText(countryCode);
        Selection.setSelection(contactET.getText(), contactET.getText().length());
        contactET.addTextChangedListener(new TextWatcher() {

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                // TODO Auto-generated method stub
            }

            @Override
            public void beforeTextChanged(CharSequence s, int start, int count,
                                          int after) {
                // TODO Auto-generated method stub

            }

            @Override
            public void afterTextChanged(Editable editable) {
                if (!editable.toString().startsWith(countryCode)) {
//                    editable.insert(0, countryCode);
                    contactET.setText(countryCode);
                    Log.d(TAG, "afterTextChanged: "+editable.toString());
                    Selection.setSelection(contactET.getText(), contactET.getText().length());
                }else {
//                    contactET.setText(editable.toString());
//                    Selection.setSelection(contactET.getText(), contactET.getText().length());
//                    Log.d(TAG, "else: "+editable.toString());
                }
            }
        });
    }

    public interface LoginFragmentAction {
        void onSignUpClicked();
    }

}