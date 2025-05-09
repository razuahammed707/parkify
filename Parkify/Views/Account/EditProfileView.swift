import SwiftUI

fileprivate let dobFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd - MM - yyyy"
    return formatter
}()

struct EditProfileView: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("email") private var email: String = ""
    @AppStorage("dob") private var dobString: String = "25 - 11 - 1990"
    @AppStorage("country") private var country: String = ""
    @AppStorage("gender") private var gender: String = "Male"

    @State private var tempUsername: String = ""
    @State private var tempEmail: String = ""
    @State private var tempDob: Date = dobFormatter.date(from: "25 - 11 - 1990")!
    @State private var tempCountry: String = ""
    @State private var tempGender: String = "Male"

    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Country Picker
    @State private var isSelectingCountry = false
    @State private var searchText = ""

    private var allCountries: [String] {
        Locale.isoRegionCodes.compactMap {
            Locale.current.localizedString(forRegionCode: $0)
        }.sorted()
    }

    private var filteredCountries: [String] {
        if searchText.isEmpty {
            return allCountries
        } else {
            return allCountries.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 20) {
                            Text("Edit Profile")
                                .font(.title2)
                                .bold()
                                .padding(.top)

                            VStack(alignment: .leading, spacing: 16) {
                                InputField(title: "Username", text: $tempUsername)
                                InputField(title: "Email", text: $tempEmail)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Date of Birth")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    DatePicker(
                                        "",
                                        selection: $tempDob,
                                        in: ...Calendar.current.date(byAdding: .year, value: -18, to: Date())!,
                                        displayedComponents: [.date]
                                    )
                                    .labelsHidden()
                                    .datePickerStyle(.wheel)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                }

                                // ✅ Country Picker with Scrollable Search
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Country")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    Button(action: {
                                        withAnimation {
                                            isSelectingCountry.toggle()
                                        }
                                    }) {
                                        HStack {
                                            Text(tempCountry.isEmpty ? "Select Country" : tempCountry)
                                                .foregroundColor(tempCountry.isEmpty ? .gray : .black)
                                            Spacer()
                                            Image(systemName: isSelectingCountry ? "chevron.up" : "chevron.down")
                                                .foregroundColor(.gray)
                                        }
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(8)
                                    }

                                    if isSelectingCountry {
                                        TextField("Search", text: $searchText)
                                            .padding(10)
                                            .background(Color(.systemGray6))
                                            .cornerRadius(8)

                                        ScrollView {
                                            VStack(alignment: .leading, spacing: 0) {
                                                ForEach(filteredCountries, id: \.self) { country in
                                                    Button(action: {
                                                        tempCountry = country
                                                        isSelectingCountry = false
                                                        searchText = ""
                                                    }) {
                                                        Text(country)
                                                            .padding(.vertical, 8)
                                                            .padding(.horizontal)
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                            .background(Color.white)
                                                    }
                                                    .buttonStyle(PlainButtonStyle())
                                                    Divider()
                                                }
                                            }
                                        }
                                        .frame(maxHeight: 200)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .shadow(radius: 2)
                                    }
                                }

                                Text("Gender")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                HStack(spacing: 16) {
                                    GenderPicker(title: "Male", selected: $tempGender)
                                    GenderPicker(title: "Female", selected: $tempGender)
                                }
                            }
                            .padding(.horizontal)

                            // ✅ Save Button — always visible
                            Button(action: {
                                if !isValidEmail(tempEmail) {
                                    alertMessage = "Please enter a valid email address."
                                    showAlert = true
                                    return
                                }

                                if !isAtLeast18(tempDob) {
                                    alertMessage = "You must be at least 18 years old."
                                    showAlert = true
                                    return
                                }

                                username = tempUsername
                                email = tempEmail
                                dobString = dobFormatter.string(from: tempDob)
                                country = tempCountry
                                gender = tempGender
                                dismiss()
                            }) {
                                Text("Save Changes")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 24)
                            .id("saveButton") // for scroll-to if needed
                        }
                    }
                }
            }
            .background(Color(UIColor.systemGray6))
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                tempUsername = username
                tempEmail = email
                tempDob = dobFormatter.date(from: dobString) ?? Date()
                tempCountry = country
                tempGender = gender
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let pattern = #"^\S+@\S+\.\S+$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }

    func isAtLeast18(_ date: Date) -> Bool {
        let cutoff = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return date <= cutoff
    }
}

// MARK: - Input Field
struct InputField: View {
    var title: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            TextField(title, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
        }
    }
}

// MARK: - Gender Picker
struct GenderPicker: View {
    var title: String
    @Binding var selected: String

    var body: some View {
        Button(action: {
            selected = title
        }) {
            HStack(spacing: 8) {
                Circle()
                    .stroke(Color.orange, lineWidth: 2)
                    .background(Circle().fill(selected == title ? Color.orange : Color.clear))
                    .frame(width: 20, height: 20)
                Text(title)
                    .foregroundColor(.black)
            }
        }
    }
}
